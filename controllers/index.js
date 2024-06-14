const connection = require("../routes/dbConnect");

module.exports.showEmp = (req,res)=>{
    const q=`SELECT * FROM EMPLOYEES;`;
    try{
        connection.query(q,(err,results)=>{
            if(err) throw err;
            const data=results;
            res.render("./routes/home.ejs", { data });
        });
        }catch(err){
            console.log(err);
            res.send("some error , plz try again!");
        }
}