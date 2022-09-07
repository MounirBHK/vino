import React from "react";
import { useState, useEffect } from "react";
import "./Signup.scss";
import { Grid, TextField, Button } from "@mui/material";
import { Link, useNavigate } from "react-router-dom";
import { getInputError } from "./formValidator/signupForm";

function Signup() {
    const [formValues, setFormValues] = useState({
        courriel: "",
        nom_utilisateur: "",
        prenom: "",
        nom: "",
        motDePasse: "",
        motDePasse_confirme: "",
    });
    const [formErrors, setFormErrors] = useState({});
    const [formIsValid, setFormIsValid] = useState(false);
    const hostOriginURL = window.location.origin;
    const navigate = useNavigate();

    const envoieDonneesForm = async (donnees) => {
        return await axios.post(
            hostOriginURL + "/api/custom-auth/signup",
            donnees
        );
    };

    function gereChangementInputValue(e) {
        const { name, value } = e.target;
        setFormValues({ ...formValues, [name]: value });
    }

    function gereChangementInput(e) {
        const { name, value } = e.target;
        const inputError = getInputError(name, value);
        if (inputError) setFormErrors({ ...formErrors, [name]: inputError });
        else {
            delete formErrors[name];
            setFormValues({ ...formValues, [name]: value.trim() });
        }
    }

    function soumetFormulaire(e) {
        e.preventDefault();
        envoieDonneesForm(formValues).then((response) => {
            if (response.status === 201 && response.statusText === "Created")
                navigate("/login", {});
        });
    }

    useEffect(() => {
        let isFormFilled = true;
        let password;
        let password_confirmed;
        for (const input in formValues) {
            if (input === "motDePasse") password = formValues[input];
            if (input === "motDePasse_confirme")
                password_confirmed = formValues[input];
            const errorInput = getInputError(input, formValues[input]);
            if (formValues[input] === "" || errorInput !== null) {
                isFormFilled = false;
                break;
            }
        }
        if (password !== password_confirmed) isFormFilled = false;
        if (Object.keys(formErrors).length === 0 && isFormFilled)
            setFormIsValid(true);
        else setFormIsValid(false);
    }, [formErrors, formValues]);

    return (
        <form onSubmit={soumetFormulaire}>
            <Grid className="Login">
                <Grid item xs={12}>
                    <TextField
                        required
                        type="email"
                        id="courriel"
                        name="courriel"
                        variant="filled"
                        label="Courriel"
                        margin="dense"
                        value={formValues.courriel}
                        onBlur={gereChangementInput}
                        onChange={gereChangementInputValue}
                        error={formErrors.courriel ? true : false}
                        helperText={formErrors.courriel}
                    >
                        Courriel
                    </TextField>
                </Grid>
                <Grid item xs={12}>
                    <TextField
                        required
                        type="text"
                        id="nom_utilisateur"
                        name="nom_utilisateur"
                        variant="filled"
                        label="Nom Utilisateur"
                        margin="dense"
                        value={formValues.nom_utilisateur}
                        onBlur={gereChangementInput}
                        onChange={gereChangementInputValue}
                        error={formErrors.nom_utilisateur ? true : false}
                        helperText={formErrors.nom_utilisateur}
                    >
                        Nom Utilisateur
                    </TextField>
                </Grid>
                <Grid item xs={12}>
                    <TextField
                        required
                        type="text"
                        id="prenom"
                        name="prenom"
                        variant="filled"
                        label="Prénom"
                        margin="dense"
                        value={formValues.prenom}
                        onBlur={gereChangementInput}
                        onChange={gereChangementInputValue}
                        error={formErrors.prenom ? true : false}
                        helperText={formErrors.prenom}
                    >
                        Prénom
                    </TextField>
                </Grid>
                <Grid item xs={12}>
                    <TextField
                        required
                        type="text"
                        id="nom"
                        name="nom"
                        variant="filled"
                        label="Nom"
                        margin="dense"
                        value={formValues.nom}
                        onBlur={gereChangementInput}
                        onChange={gereChangementInputValue}
                        error={formErrors.nom ? true : false}
                        helperText={formErrors.nom}
                    >
                        Nom
                    </TextField>
                </Grid>
                <Grid item xs={12}>
                    <TextField
                        required
                        type="password"
                        id="motDePasse"
                        name="motDePasse"
                        variant="filled"
                        label="Mot de passe"
                        margin="dense"
                        value={formValues.motDePasse}
                        onBlur={gereChangementInput}
                        onChange={gereChangementInputValue}
                        error={formErrors.motDePasse ? true : false}
                        helperText={formErrors.motDePasse}
                    >
                        Mot de passe
                    </TextField>
                </Grid>
                <Grid item xs={12}>
                    <TextField
                        required
                        type="password"
                        id="motDePasse_confirme"
                        name="motDePasse_confirme"
                        variant="filled"
                        label="Confirmer Mot de passe"
                        margin="dense"
                        value={formValues.motDePasse_confirme}
                        onBlur={gereChangementInput}
                        onChange={gereChangementInputValue}
                        error={formErrors.motDePasse_confirme ? true : false}
                        helperText={formErrors.motDePasse_confirme}
                    >
                        Confirmer Mot de passe
                    </TextField>
                </Grid>
                <Grid item xs={12}>
                    <Button
                        variant="contained"
                        type="submit"
                        disabled={!formIsValid}
                    >
                        Valider
                    </Button>
                </Grid>
                <Grid item xs={12}>
                    <Link to={"/login"}>Déjà Membre? Connectez-vous ici!</Link>
                </Grid>
            </Grid>
        </form>
    );
}

export default Signup;
