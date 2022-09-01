import React from "react";
import "./Login.scss";
import { Grid, TextField, Button } from "@mui/material";
import { Link } from "react-router-dom";

function Login() {
    return (
        <Grid className="Login">
            <Grid item xs={12}>
                <TextField
                    required
                    variant="filled"
                    label="Courriel"
                    margin="dense"
                >
                    Courriel
                </TextField>
            </Grid>
            <Grid item xs={12}>
                <TextField
                    required
                    variant="filled"
                    label="Mot de passe"
                    margin="dense"
                >
                    Mot de passe
                </TextField>
            </Grid>
            <Grid item xs={12}>
                <Button variant="contained">Valider</Button>
            </Grid>
            <Grid item xs={12}>
                <Link to={"/signup"}>
                    Pas encore Membre? Inscrivez-vous ici!
                </Link>
            </Grid>
        </Grid>
    );
}

export default Login;
