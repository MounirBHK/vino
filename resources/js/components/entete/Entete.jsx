import React from "react";
import { Link } from "react-router-dom";
import logoJaune from "../../../images/logoJaune.png";
import logoutIcon from "../../../images/logout-icon.png";
import AccountCircleOutlinedIcon from "@mui/icons-material/AccountCircleOutlined";
import Fab from "@mui/material/Fab";
import "./Entete.scss";

function Entete({ userLoggedIn, gereDeconnexion }) {
    return (
        <div className="App-header">
            <div className="profil">
                <img src={logoJaune} alt="logo" />
                <div className="utilisateur">
                    <p>
                        Bonjour,
                        <br /> {userLoggedIn.name}
                    </p>
                    <AccountCircleOutlinedIcon />
                    <img
                        className="logout-icon"
                        src={logoutIcon}
                        alt="logout icon"
                        onClick={() => gereDeconnexion(userLoggedIn)}
                    />
                </div>
            </div>
            <div className="h1">
                <h1>Tableau de bord</h1>
            </div>
            <Fab variant="extended">
                {" "}
                <Link to="/dashboard/celliers">Vos celliers</Link>
            </Fab>
        </div>
    );
}

export default Entete;
