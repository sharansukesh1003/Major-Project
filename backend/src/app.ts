import express from "express"
import { authRouter } from "./routes/authentication.routes"
import { createConnection, ConnectionOptions } from "typeorm"
import config from "./ormconfig"
import "reflect-metadata"
import { postRouter } from "./routes/post.routes"

const app = express();
const port = process.env.PORT || 8000;

createConnection(config as ConnectionOptions).then((connection)=>{
    if(connection.isConnected){
        console.log("Postgrase Connected")
    }
    app.set("port",port);
    app.use(express.json());
    app.use(express.urlencoded({ extended: false }));
    // Authentication
    app.use("/user",authRouter)
    // Post
    app.use("/post",postRouter)
    app.listen(app.get("port"),() => {
    console.log(`Server live on ${app.get("port")}`)
    });
});

