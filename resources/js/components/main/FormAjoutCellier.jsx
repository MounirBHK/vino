import React from "react";
import axios from "axios";
import { useState, useRef, useEffect, useContext } from "react";
import { useNavigate } from "react-router-dom";
import CelliersContext from "../../context/celliersContext";

function FormAjoutCellier({ setCelliers }) {
    const celliers = useContext(CelliersContext);
    const navigate = useNavigate();
    const hostOriginURL = window.location.origin;
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;

    const [libelle, setLibelle] = useState("");
    const [capacite, setCapacite] = useState("");

    const putNewCellier = async (newCellier) => {
        // console.log(newCellier);
        return await axios.post(
            hostOriginURL + "/api/ajouterCellier",
            newCellier,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };

    const handleSubmit = (e) => {
        e.preventDefault();

        if (userLoggedIn) {
            const userId = userLoggedIn.user.id;
            const newCellier = {
                id_user: userId,
                lib_cellier: libelle,
                capacite: parseInt(capacite),
            };

            putNewCellier(newCellier).then((response) => {
                setCelliers([...celliers, response.data]);
                navigate(`/dashboard/celliers`);
            });
        }
    };

    return (
        <div>
            <h1>Formulaire ajout cellier</h1>
            <form action="submit" onSubmit={handleSubmit}>
                <label htmlFor="libelle">
                    Libellé :
                    <input
                        required
                        type="text"
                        name="libelle"
                        id="libelle"
                        placeholder="Saisir un libellé"
                        value={libelle}
                        onChange={(e) => setLibelle(e.target.value)}
                    />
                </label>
                <label htmlFor="capacite">
                    Capacité :
                    <input
                        required
                        type="number"
                        name="capacite"
                        id="capacite"
                        placeholder="Saisir la capacite"
                        value={capacite}
                        onChange={(e) => setCapacite(e.target.value)}
                    />
                </label>

                <button>Ajouter Cellier</button>
            </form>
        </div>
    );
}

export default FormAjoutCellier;
