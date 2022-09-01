import React, { useContext } from "react";
import { Link } from "react-router-dom";
import logoJaune from "../../../images/logoJaune.png";
import AccountCircleOutlinedIcon from "@mui/icons-material/AccountCircleOutlined";
import Fab from "@mui/material/Fab";
import CelliersContext from "../../context/celliersContext";
import "./Entete.scss";

function Entete() {
    return (
        <div className="App-header">
            <div className="profil">
                <img src={logoJaune} alt="logo" />
                <div className="utilisateur">
                    <p>
                        Bonjour,
                        <br /> votre nom
                    </p>
                    <AccountCircleOutlinedIcon />
                </div>
            </div>
            <div className="h1">
                <h1>Tableau de bord</h1>
            </div>
            <Fab variant="extended">
                {" "}
                <Link to="/">Vos celliers</Link>
            </Fab>
        </div>
    );
}

export default Entete;
