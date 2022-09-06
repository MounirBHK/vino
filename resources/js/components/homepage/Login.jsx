import React from "react";
import { useState, useContext } from "react";
import "./Login.scss";
import { Grid, TextField, Button, Alert, IconButton } from "@mui/material";
import CloseIcon from "@mui/icons-material/Close";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import UserContext from "../../context/userContext";

function Login() {
    const { user } = useContext(UserContext);
    const [userState, setUser] = user;
    const [loginErrorMsg, setLoginErrorMsg] = useState(null);
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

    console.log(loginErrorMsg);
    function gereChangementInput(e) {
        const { name, value } = e.target;
        setFormValues({ ...formValues, [name]: value });
    }

    function gereConnexion(e) {
        e.preventDefault();
        envoieIdentifiants(formValues)
            .then((response) => {
                const UserLoggedIn = response.data;
                localStorage.setItem("user", JSON.stringify(UserLoggedIn));
                setUser(UserLoggedIn);
                navigate("/dashboard", {});
                console.log(UserLoggedIn);
            })
            .catch((error) => {
                if (error.response.status === 401) {
                    setLoginErrorMsg(error.response);
                }
            });
    }
    return (
        <React.Fragment>
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
            <form onSubmit={gereConnexion}>
                <Grid className="Login">
                    <Grid item xs={12}>
                        <TextField
                            required
                            type="email"
                            name="courriel"
                            id="courriel"
                            label="Courriel"
                            variant="filled"
                            margin="dense"
                            value={formValues.courriel}
                            onChange={gereChangementInput}
                        >
                            Courriel
                        </TextField>
                    </Grid>
                    <Grid item xs={12}>
                        <TextField
                            required
                            type="password"
                            id="motDePasse"
                            name="motDePasse"
                            label="Mot de passe"
                            variant="filled"
                            margin="dense"
                            value={formValues.motDePasse}
                            onChange={gereChangementInput}
                        >
                            Mot de passe
                        </TextField>
                    </Grid>
                    <Grid item xs={12}>
                        <Button variant="contained" type="submit">
                            Valider
                        </Button>
                    </Grid>
                    <Grid item xs={12}>
                        <Link to={"/signup"}>
                            Pas encore Membre? Inscrivez-vous ici!
                        </Link>
                    </Grid>
                </Grid>
            </form>
        </React.Fragment>
    );
}

export default Login;
