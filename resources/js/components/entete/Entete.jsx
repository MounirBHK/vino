import React from "react";
import { Link } from "react-router-dom";
import logoJaune from "../../../images/logoJaune.png";
import Fab from "@mui/material/Fab";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPowerOff } from "@fortawesome/free-solid-svg-icons";
import "./Entete.scss";

function Entete({ userLoggedIn, gereDeconnexion }) {
    return (
        <div className="App-header">
            <div className="profil"></div>
            <img src={logoJaune} alt="logo" />
            <div className="actions">
                <div className="utilisateur">
                    <p>
                        Bonjour <br /> {userLoggedIn.user.name}
                    </p>
                </div>
            </div>
        </div>
    );
}

export default Entete;
