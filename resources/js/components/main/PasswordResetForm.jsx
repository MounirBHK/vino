import React from "react";
import { useState, useEffect } from "react";
import { TextField, Button, Alert, IconButton, Card } from "@mui/material";
import CloseIcon from "@mui/icons-material/Close";
import "./PasswordResetForm.scss";
import { Link, useNavigate } from "react-router-dom";
import { getInputError } from "../homepage/formValidator/signupForm";

function PasswordResetForm({ userLoggedIn }) {
    const [formValues, setFormValues] = useState({
        motDePasse: "",
        motDePasse_confirme: "",
    });
    const [formErrors, setFormErrors] = useState({});
    const [formIsValid, setFormIsValid] = useState(false);
    const hostOriginURL = window.location.origin;
    const navigate = useNavigate();

    const envoieDonneesForm = async (donnees) => {
        return await axios.put(
            hostOriginURL + "/api/custom-auth/resetPassword",
            donnees,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
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
        const arrayLocation = location.pathname.split("/");
        const tempPassword = arrayLocation[3];
        formValues.tempPassword = tempPassword;
        envoieDonneesForm(formValues)
            .then((response) => {
                navigate("/dashboard/profil", {
                    state: {
                        success_message:
                            "Votre mot de passe a bien été modifié",
                    },
                });
            })
            .catch((error) => {
                if (error) console.log(error);
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
        <Card>
            <h2>Nouveau mot de passe</h2>
            <form className="PasswordResetForm" onSubmit={soumetFormulaire}>
                <TextField
                    className="textField"
                    required
                    type="password"
                    id="motDePasse"
                    name="motDePasse"
                    variant="outlined"
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
                <TextField
                    className="textField"
                    required
                    type="password"
                    id="motDePasse_confirme"
                    name="motDePasse_confirme"
                    variant="outlined"
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
                <Button
                    className="valider"
                    variant="contained"
                    type="submit"
                    disabled={!formIsValid}
                >
                    Valider
                </Button>
            </form>
        </Card>
    );
}

export default PasswordResetForm;
