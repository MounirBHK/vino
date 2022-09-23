import React from "react";
import { useState, useEffect, useContext } from "react";
import { useLocation } from "react-router-dom";
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
    Alert,
    IconButton,
} from "@mui/material";
import CloseIcon from "@mui/icons-material/Close";
import { getInputError } from "../homepage/formValidator/signupForm";
import UserContext from "../../context/userContext";

function Profil({ userLoggedIn }) {
    const { state: stateUpdatePasswordSuccessMsg } = useLocation();
    const [updatePasswordSuccessMsg, setUpdatePasswordSuccessMsg] = useState(
        stateUpdatePasswordSuccessMsg || null
    );
    const userContext = useContext(UserContext);
    const [user, setUser] = userContext;
    const [open, setOpen] = useState(false);
    const [formValues, setFormValues] = useState({
        nom_utilisateur: userLoggedIn["user"].name,
        email: userLoggedIn["user"].email,
        prenom: userLoggedIn["user"].prenom,
        nom: userLoggedIn["user"].nom,
    });
    const [formErrors, setFormErrors] = useState({});
    const [formIsValid, setFormIsValid] = useState(false);
    const [updateErrorMsg, setUpdateErrorMsg] = useState(null);
    const [emailSentSuccessMsg, setEmailSentSuccessMsg] = useState(null);
    const [updateSuccessMsg, setUpdateSuccessMsg] = useState(null);
    const hostOriginURL = window.location.origin;

    const envoieDonneesForm = async (donnees) => {
        return await axios.put(
            hostOriginURL + "/api/custom-auth/update",
            donnees,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };

    const envoiEmail = async () => {
        return await axios.get(hostOriginURL + "/api/custom-auth/envoiEmail", {
            headers: {
                Authorization: "Bearer " + userLoggedIn.access_token,
            },
        });
    };

    function handleEnvoiEmail() {
        envoiEmail().then((response) => {
            setEmailSentSuccessMsg(
                `L'email de réinitialisation a bien été envoyé à l'adresse: ` +
                    response.data.email
            );
        });
    }

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
        envoieDonneesForm(formValues)
            .then((response) => {
                userLoggedIn.user = response.data;
                localStorage.setItem("user", JSON.stringify(userLoggedIn));
                setUser(userLoggedIn);
                setUpdateSuccessMsg("Modifications effectuées avec succès");
                setOpen(false);
            })
            .catch((error) => {
                setUpdateErrorMsg(error.response);
            });
    }

    const handleClose = () => {
        setFormValues({
            nom_utilisateur: userLoggedIn["user"].name,
            email: userLoggedIn["user"].email,
            prenom: userLoggedIn["user"].prenom,
            nom: userLoggedIn["user"].nom,
        });
        setOpen(false);
    };

    const handleClickOpen = () => {
        setUpdateSuccessMsg(false);
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
            {emailSentSuccessMsg && (
                <Alert
                    severity="success"
                    action={
                        <IconButton
                            aria-label="close"
                            color="inherit"
                            size="small"
                            onClick={() => {
                                setEmailSentSuccessMsg(null);
                            }}
                        >
                            <CloseIcon fontSize="inherit" />
                        </IconButton>
                    }
                >
                    {emailSentSuccessMsg}
                </Alert>
            )}
            {updatePasswordSuccessMsg && (
                <Alert
                    severity="success"
                    action={
                        <IconButton
                            aria-label="close"
                            color="inherit"
                            size="small"
                            onClick={() => {
                                setUpdatePasswordSuccessMsg(null);
                            }}
                        >
                            <CloseIcon fontSize="inherit" />
                        </IconButton>
                    }
                >
                    {updatePasswordSuccessMsg.success_message}
                </Alert>
            )}
            {updateSuccessMsg && (
                <Alert
                    severity="success"
                    action={
                        <IconButton
                            aria-label="close"
                            color="inherit"
                            size="small"
                            onClick={() => {
                                setUpdateSuccessMsg(null);
                            }}
                        >
                            <CloseIcon fontSize="inherit" />
                        </IconButton>
                    }
                >
                    {updateSuccessMsg}
                </Alert>
            )}
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
            <Button
                className="modifier"
                variant="contained"
                onClick={handleEnvoiEmail}
            >
                Réinitialiser le mot de passe
            </Button>
            <Dialog className="Profil-dialog" open={open} onClose={handleClose}>
                <DialogTitle>Mes informations</DialogTitle>
                <DialogContent>
                    <DialogContentText>
                        Modifier vos informations personnelles puis cliquer sur
                        envoyer
                    </DialogContentText>
                    {updateErrorMsg && (
                        <Alert
                            severity="error"
                            action={
                                <IconButton
                                    aria-label="close"
                                    color="inherit"
                                    size="small"
                                    onClick={() => {
                                        setUpdateErrorMsg(null);
                                    }}
                                >
                                    <CloseIcon fontSize="inherit" />
                                </IconButton>
                            }
                        >
                            {updateErrorMsg.data}
                        </Alert>
                    )}
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
                        id="email"
                        name="email"
                        label="Courriel"
                        type="email"
                        fullWidth
                        variant="standard"
                        value={formValues.email}
                        onBlur={gereChangementInput}
                        onChange={gereChangementInputValue}
                        error={formErrors.email ? true : false}
                        helperText={formErrors.email}
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
