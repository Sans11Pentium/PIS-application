if (process.env.NODE_ENV != "production") {
    require('dotenv').config();
}
const express = require("express");
const app = express();
const path = require("path");
const ejsMate = require("ejs-mate");
const methodOverride = require("method-override");
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const { validPassword } = require("./middleware.js");
const cookieParser = require("cookie-parser");
const session = require('express-session');
const MySQLStore = require('express-mysql-session')(session);
const flash = require("connect-flash");
const ExpressError = require("./utils/ExpressError.js");
const indexController = require("./controllers/index.js");
const { queryAsync } = require('./utils/dbUtils');
const userConnection = require("./routes/userDbConnect.js");

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "/views"));
app.use(express.urlencoded({ extended: true }));
app.use(methodOverride("_method"));
app.engine("ejs", ejsMate);
app.use(express.static(path.join(__dirname, "public")));

/*Mysql Express Session*/
const options = {
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'sans',
    database: 'cookie_user',
    touchAfter: 24 * 3600,
};

const sessionStore = new MySQLStore(options);
sessionStore.on("error", (err) => {
    console.log("ERROR in MySQL SESSION STORE", err);
});

app.use(session({
    key: 'session_cookie_name',
    secret: 'session_cookie_secret',
    store: sessionStore,
    resave: false,
    saveUninitialized: false,
    cookie: {
        expires: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000), // 7 days from now
        maxAge: 7 * 24 * 60 * 60 * 1000,
        httpOnly: true,
    }
}));

app.use(passport.initialize());
app.use(passport.session());

app.use((req, res, next) => {
    res.locals.currUser = req.user;
    console.log(req.user);
    console.log(res.user);
    console.log("The current user is: ", req.user);
    next();
})

const customFields = {
    usernameField: 'uname',
    passwordField: 'pw',
};

const verifyCallback = async (username, password, done) => {
    try {
        const results = await queryAsync('SELECT * FROM users WHERE username = ?', [username]);
        if (results.length == 0) {
            return done(null, false);
        }
        const isValid = validPassword(password, results[0].hash, results[0].salt);
        const user = { id: results[0].id, username: results[0].username, hash: results[0].hash, salt: results[0].salt };
        if (isValid) {
            return done(null, user);
        } else {
            return done(null, false);
        }
    } catch (err) {
        return done(err);
    }
};

const strategy = new LocalStrategy(customFields, verifyCallback);
passport.use(strategy);

passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser(async (userId, done) => {
    try {
        const results = await queryAsync('SELECT * FROM users where id = ?', [userId]);
        done(null, results[0]);
    } catch (err) {
        done(err);
    }
});

app.use(flash());
app.use((req, res, next) => {
    res.locals.success = req.flash("success");
    res.locals.error = req.flash("error");
    res.locals.msg = req.flash("msg");
    console.log("The current user is: ", req.user);
    next();
});

const newJoinRouter = require("./routes/new-join.js");
const bdayRouter = require("./routes/bday.js");
const retireRouter = require("./routes/retire.js");
const adminRouter = require("./routes/admin.js");
const empRouter = require("./routes/employee.js");

app.use("/bday", bdayRouter);
app.use("/retire", retireRouter);
app.use("/new-join", newJoinRouter);
app.use("/admin", adminRouter);
app.use("/emp", empRouter);

app.get("/", indexController.showEmp);

app.all("*", (req, res, next) => {
    next(new ExpressError(404, "Page Not Found"));
});

app.use((err, req, res, next) => {
    let { statusCode = 500, message = "something went wrong" } = err;
    console.log(err);
    res.status(statusCode).render("error.ejs", { message });
    next()
});

const port = 8080;
app.listen(port, () => {
    console.log("server is listening to port 8080");
});