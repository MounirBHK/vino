import React from "react";
import { useState, useEffect } from "react";
import "./Profil.scss";
import {
    Button,
    Card,
    Dialog,
    DialogContent,
    DialogContentText,
    DialogTitle,
    DialogActions,
    TextField,
} from "@mui/material";
import { getInputError } from "../homepage/formValidator/signupForm";

function Profil({ userLoggedIn }) {
    const [open, setOpen] = useState(false);
    const [formValues, setFormValues] = useState({
        nom_utilisateur: userLoggedIn["user"].name,
        courriel: userLoggedIn["user"].email,
        prenom: userLoggedIn["user"].prenom,
        nom: userLoggedIn["user"].nom,
    });
    const [formErrors, setFormErrors] = useState({});
    const [formIsValid, setFormIsValid] = useState(false);

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

    function soumetFormulaire() {
        console.log(formValues);
        // envoieDonneesForm(formValues).then((response) => {
        //     if (response.status === 201)
        //         navigate("/login", {
        //             state: {
        //                 success_message:
        //                     "Votre compte a été créé avec succes, connectez-vous!",
        //             },
        //         });
        // });
    }

    const handleClose = () => {
        setFormValues({
            nom_utilisateur: userLoggedIn["user"].name,
            courriel: userLoggedIn["user"].email,
            prenom: userLoggedIn["user"].prenom,
            nom: userLoggedIn["user"].nom,
        });
        setOpen(false);
    };

    const handleClickOpen = () => {
        setOpen(true);
    };

    useEffect(() => {
        let isFormFilled = true;
        for (const input in formValues) {
            const errorInput = getInputError(input, formValues[input]);
            if (formValues[input] === "" || errorInput !== null) {
                isFormFilled = false;
                break;
            }
        }
        if (Object.keys(formErrors).length === 0 && isFormFilled)
            setFormIsValid(true);
        else setFormIsValid(false);
    }, [formErrors, formValues]);

    return (
        <React.Fragment>
            <h2>Mon Profil</h2>
            <Card className="Profil">
                <div className="Profil-field">
                    <span className="Profil-field-label">
                        Nom d'utilisateur:{" "}
                    </span>
                    <span>{userLoggedIn["user"].name}</span>
                </div>
                <div className="Profil-field">
                    <span className="Profil-field-label">Courriel: </span>
                    <span>{userLoggedIn["user"].email}</span>
                </div>
                <div className="Profil-field">
                    <span className="Profil-field-label">Prénom: </span>
                    <span>{userLoggedIn["user"].prenom}</span>
                </div>
                <div className="Profil-field">
                    <span className="Profil-field-label">Nom: </span>
                    <span>{userLoggedIn["user"].nom}</span>
                </div>
            </Card>
            <Button
                className="modifier"
                variant="contained"
                onClick={handleClickOpen}
            >
                Modifier
            </Button>
            <Dialog className="Profil-dialog" open={open} onClose={handleClose}>
                <DialogTitle>Mes informations</DialogTitle>
                <DialogContent>
                    <DialogContentText>
                        Modifier vos informations personnelles puis cliquer sur
                        envoyer
                    </DialogContentText>
                    <TextField
                        autoFocus
                        margin="dense"
                        id="nom_utilisateur"
                        name="nom_utilisateur"
                        label="Nom d'utilisateur"
                        type="text"
                        fullWidth
                        variant="standard"
                        value={formValues.nom_utilisateur}
                        onBlur={gereChangementInput}
                        onChange={gereChangementInputValue}
                        error={formErrors.nom_utilisateur ? true : false}
                        helperText={formErrors.nom_utilisateur}
                    />
                    <TextField
                        autoFocus
                        margin="dense"
                        id="courriel"
                        name="courriel"
                        label="Courriel"
                        type="email"
                        fullWidth
                        variant="standard"
                        value={formValues.courriel}
                        onBlur={gereChangementInput}
                        onChange={gereChangementInputValue}
                        error={formErrors.courriel ? true : false}
                        helperText={formErrors.courriel}
                    />
                    <TextField
                        autoFocus
                        margin="dense"
                        id="prenom"
                        name="prenom"
                        label="Prénom"
                        type="text"
                        fullWidth
                        variant="standard"
                        value={formValues.prenom}
                        onBlur={gereChangementInput}
                        onChange={gereChangementInputValue}
                        error={formErrors.prenom ? true : false}
                        helperText={formErrors.prenom}
                    />
                    <TextField
                        autoFocus
                        margin="dense"
                        id="nom"
                        name="nom"
                        label="Nom"
                        type="text"
                        fullWidth
                        variant="standard"
                        value={formValues.nom}
                        onBlur={gereChangementInput}
                        onChange={gereChangementInputValue}
                        error={formErrors.nom ? true : false}
                        helperText={formErrors.nom}
                    />
                </DialogContent>
                <DialogActions>
                    <Button onClick={handleClose}>Annuler</Button>
                    <Button onClick={soumetFormulaire} disabled={!formIsValid}>
                        Envoyer
                    </Button>
                </DialogActions>
            </Dialog>
        </React.Fragment>
    );
}

export default Profil;
