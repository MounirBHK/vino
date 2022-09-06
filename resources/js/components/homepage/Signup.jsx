import React from "react";
import "./Signup.scss";
import { Grid, TextField, Button } from "@mui/material";
import { Link } from "react-router-dom";

function Signup() {
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
                    label="Prénom"
                    margin="dense"
                >
                    Prénom
                </TextField>
            </Grid>
            <Grid item xs={12}>
                <TextField required variant="filled" label="Nom" margin="dense">
                    Nom
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
                <Link to={"/login"}>Déjà Membre? Connectez-vous ici!</Link>
            </Grid>
        </Grid>
    );
}

export default Signup;
