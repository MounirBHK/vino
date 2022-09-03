import React from "react";
import { useState, useContext } from "react";
import "./Login.scss";
import { Grid, TextField, Button } from "@mui/material";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import UserContext from "../../context/userContext";

function Login() {
    const { user } = useContext(UserContext);
    const [userState, setUser] = user;
    const [formValues, setFormValues] = useState({
        courriel: "",
        motDePasse: "",
    });
    const hostOriginURL = window.location.origin;
    const navigate = useNavigate();
    const envoieIdentifiants = async (identifiants) => {
        return await axios.post(
            hostOriginURL + "/api/custom-login",
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
                const UserLoggedIn = response.data;
                localStorage.setItem("user", JSON.stringify(UserLoggedIn));
                setUser(UserLoggedIn);
                navigate("/dashboard", {});
            })
            .catch((error) => {
                console.log(error);
            });
    }
    return (
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
    );
}

export default Login;
