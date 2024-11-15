const express = require("express");
const app = express();
const PORT = 3000;
const neo4j = require("neo4j-driver");
app.use(express.urlencoded({extended:true}));
app.use(express.json());


const driver = neo4j.driver(
    "bolt://44.204.114.131:7687",
    neo4j.auth.basic("neo4j","dispatchers-instructor-housefalls")
);
app.get("/login", (req, res) => {
    const { mobile, password } = req.query;

    // Validate input
    if (!mobile || !password) {
        return res.status(400).json({ error: "Mobile and password are required" });
    }
 
    console.log("Mobile:", mobile);
    console.log("Password:", password);

    // Create a new session each time for the query to ensure it is not using an already active transaction
    const session = driver.session();

    session
        .run(
            "MATCH (u:User {mobile: $mobile, password: $password}) RETURN u",
            { mobile: neo4j.int(mobile), password: password }
        )
        .then((result) => {
            if (result.records.length > 0) {
                const users = result.records.map((record) => {
                    const userNode = record.get("u");
                    return {
                        name: userNode.properties.name,
                        mobile:  userNode.properties.mobile.toNumber(),
                        password: userNode.properties.password,
                        email: userNode.properties.email,
                    };
                });
               console.log("return user");
               res.setHeader("Content-Type", "application/json");
                return res.status(200).json(users); // Send array of user objects
            } else {
                return res.status(404).json({ error: "User not found" });
            }
        })
        .catch((err) => {
            console.error("Database error:", err);
            return res.status(500).json({ error: "Internal server error" });
        })
        .finally(() => {
            session.close();  // Ensure session is closed after query execution
        });
});





app.post("/registerUser",(req,res)=>{
    const userName= String(req.body.userName);
    console.log(userName);
    const mobile = Number(req.body.mobileNo);
    const email= String(req.body.email);
    const password = String(req.body.password);
const session = driver.session();


    session
    .run("CREATE (:User {name:$name,mobile:$mobile,email:$email,password:$password})",
        { name: userName, mobile: neo4j.int(mobile), email: email, password:password} 
    )
    .then((result)=>{
        if(result !== undefined){
            console.log(result);
            return res.end("user register sucessfully");
        }
        return res.end("user not register sucessfully");

    })
    .catch((err)=>console.log(err))
    .finally(() => {
        session.close();  // Ensure session is closed after query execution
    });
})
app.listen(PORT,()=>console.log(`Server is succefull running on ${PORT} port no`));