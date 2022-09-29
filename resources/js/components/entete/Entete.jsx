import React, { useEffect } from "react";
import { Link, useNavigate  } from "react-router-dom";
import logoJaune from "../../../images/logoJaune.png";
import { IconButton, Button } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faCircleLeft } from "@fortawesome/free-solid-svg-icons";
import "./Entete.scss";

function Entete({ userLoggedIn }) {
    const pageKey = sessionStorage.getItem("initialPageKey") || null;
    const navigate = useNavigate();
    const handleBack = () => {
        navigate(-1);
    };
    useEffect(() => {
        if (pageKey === null)
            sessionStorage.setItem("initialPageKey", window.history.state.key);
    }, []);
    return (
        <div className="App-header">
            {window.history.state.key !== pageKey && (
                <IconButton
                    className="back"
                    label="retour"
                    onClick={handleBack}
                >
                    <FontAwesomeIcon icon={faCircleLeft} />
                </IconButton>
            )}
            <div className="App-header-logo">
                <Button onClick={() => navigate(`/dashboard`, {})}>
                    <img src={logoJaune} alt="logo" />
                </Button>
                <p>Bonjour {userLoggedIn.user.name}</p>
            </div>
        </div>
    );
}

export default Entete;
