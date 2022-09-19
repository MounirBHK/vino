import { React, useState, useContext } from "react";
import "./Form.scss";
import { TextField, Button, Alert, IconButton } from "@mui/material";
import CloseIcon from "@mui/icons-material/Close";
import { Link, useNavigate, useLocation } from "react-router-dom";
import axios from "axios";
import UserContext from "../../context/userContext";

function Login() {
    const { state: stateSignupConfMsg } = useLocation();
    const { user } = useContext(UserContext);
    const [userState, setUser] = user;
    const [loginErrorMsg, setLoginErrorMsg] = useState(null);
    const [signupSuccessMsg, setSignupSuccesMsg] = useState(
        stateSignupConfMsg || null
    );
    const [formValues, setFormValues] = useState({
        courriel: "",
        motDePasse: "",
    });
    const hostOriginURL = window.location.origin;
    const navigate = useNavigate();
    const envoieIdentifiants = async (identifiants) => {
        return await axios.post(
            hostOriginURL + "/api/custom-auth/login",
            identifiants
        );
    };

    function gereChangementInput(e) {
        const { name, value } = e.target;
        setFormValues({ ...formValues, [name]: value });
    }

    function gereConnexion(e) {
        e.preventDefault();
        envoieIdentifiants(formValues)
            .then((response) => {
                console.log(response.data);
                const UserLoggedIn = response.data;
                localStorage.setItem("user", JSON.stringify(UserLoggedIn));
                setUser(UserLoggedIn);
                navigate("/dashboard", {});
            })
            .catch((error) => {
                if (error.response.status === 401) {
                    setLoginErrorMsg(error.response);
                }
            });
    }
    return (
        <div className="Form">
            {loginErrorMsg && (
                <Alert
                    severity="error"
                    action={
                        <IconButton
                            aria-label="close"
                            color="inherit"
                            size="small"
                            onClick={() => {
                                setLoginErrorMsg(null);
                            }}
                        >
                            <CloseIcon fontSize="inherit" />
                        </IconButton>
                    }
                >
                    {loginErrorMsg.data}
                </Alert>
            )}
            {signupSuccessMsg && (
                <Alert
                    severity="success"
                    action={
                        <IconButton
                            aria-label="close"
                            color="inherit"
                            size="small"
                            onClick={() => {
                                window.history.replaceState({}, "/login");
                                setSignupSuccesMsg(null);
                            }}
                        >
                            <CloseIcon fontSize="inherit" />
                        </IconButton>
                    }
                >
                    {signupSuccessMsg.success_message}
                </Alert>
            )}
            <h2>CONNEXION</h2>
            <form className="Form" onSubmit={gereConnexion}>
                <TextField
                    className="textField"
                    required
                    type="email"
                    name="courriel"
                    id="courriel"
                    label="Courriel"
                    variant="outlined"
                    margin="dense"
                    value={formValues.courriel}
                    onChange={gereChangementInput}
                >
                    Courriel
                </TextField>
                <TextField
                    className="textField"
                    required
                    type="password"
                    id="motDePasse"
                    name="motDePasse"
                    label="Mot de passe"
                    variant="outlined"
                    margin="dense"
                    value={formValues.motDePasse}
                    onChange={gereChangementInput}
                >
                    Mot de passe
                </TextField>
                <Button className="valider" variant="contained" type="submit">
                    Valider
                </Button>
                <Link to={"/signup"}>
                    Pas encore Membre? <span>Inscrivez-vous ici!</span>
                </Link>
            </form>
        </div>
    );
}

export default Login;
