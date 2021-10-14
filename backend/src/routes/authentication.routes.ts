import Router from "express"
import { AuthenticationController } from "../controllers/authentication.controller";

const authRouter = Router();
authRouter.post("/signup", AuthenticationController.signUp);
authRouter.post("/login",AuthenticationController.login);
export { authRouter }