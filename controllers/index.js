const connection = require("../routes/dbConnect");

module.exports.showEmp = (req,res)=>{
    const q=`SELECT id,employee_id,first_name,middle_name,last_name,gender,job_title,work_phone,mobile_phone,work_email,department FROM EMPLOYEES;`;
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