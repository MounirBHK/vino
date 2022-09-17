import React from "react";
import { Link } from "react-router-dom";
import logoJaune from "../../../images/logoJaune.png";
import "./Entete.scss";

function Entete({ userLoggedIn, gereDeconnexion }) {
    return (
        <div className="App-header">
            <Link to={"/dashboard"}>
                <img src={logoJaune} alt="logo" />
            </Link>
                    <p>
                        Bonjour {userLoggedIn.user.name}
                    </p>
        </div>
    );
}

export default Entete;
