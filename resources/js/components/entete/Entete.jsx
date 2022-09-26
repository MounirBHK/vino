import React, { useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import logoJaune from "../../../images/logoJaune.png";
import { IconButton } from "@mui/material";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBackward } from "@fortawesome/free-solid-svg-icons";
import "./Entete.scss";

function Entete({ userLoggedIn, gereDeconnexion }) {
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
                    size="large"
                >
                    <span>page précédente</span>
                    <FontAwesomeIcon icon={faBackward} />
                </IconButton>
            )}
            <div className="App-header-logo">
                <Link to={"/dashboard"}>
                    <img src={logoJaune} alt="logo" />
                </Link>
                <p>Bonjour {userLoggedIn.user.name}</p>
            </div>
        </div>
    );
}

export default Entete;
