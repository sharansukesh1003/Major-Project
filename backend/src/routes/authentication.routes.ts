import Router from "express"
import { AuthenticationController } from "../controllers/authentication.controller";

const authRouter = Router();
// get methods
authRouter.get("/decode-jwt",AuthenticationController.decodeJwt);
// post methods
authRouter.post("/signup", AuthenticationController.signUp);
authRouter.post("/login",AuthenticationController.login);
export { authRouter }