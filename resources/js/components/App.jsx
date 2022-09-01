import axios from "axios";
import React, { useState, useEffect } from "react";
import { CelliersProvider } from "../context/celliersContext";
import { BouteillesProvider } from "../context/bouteillesContext";
import Entete from "./entete/Entete";
import NavBottom from "./navigation/NavBottom";
import Main from "./main/Main";

function App() {
    const [bouteilles, setBouteilles] = useState([]);
    const [celliers, setCelliers] = useState([]);
    const [user, setUser] = useState(1);
    const hostOriginURL = window.location.origin;

    const getCelliers = async (userId) => {
        return await axios.get(hostOriginURL + "/api/celliers/user/" + userId);
    };

    const getBouteilles = async (idCellier) => {
        return await axios.get(hostOriginURL + "/api/cellier/" + idCellier);
    };

    const changeQuantite = async (
        idCellier,
        idBouteille,
        quantite,
        operation
    ) => {
        const bouteille = {
            idCellier: idCellier,
            idBouteille: idBouteille,
            quantite: quantite,
            operation: operation,
        };
        return await axios.put(
            hostOriginURL + "/api/changeQuantiteBouteille",
            bouteille
        );
    };

    useEffect(() => {
        const userId = user;
        getCelliers(userId).then((celliersData) => {
            setCelliers(celliersData.data);
        });
    }, []);

    function gereSelectCellier(idCellier) {
        getBouteilles(idCellier).then((bouteillesData) => {
            setBouteilles(bouteillesData.data);
        });
    }

    function gereQuantite(idCellier, idBouteille, quantite, operation) {
        changeQuantite(idCellier, idBouteille, quantite, operation).then(
            (response) => {
                const idCellier = response.data[0].id_cellier;
                const idBouteille = response.data[0].id_bouteille;
                const quantite = response.data[0].quantite;
                const newBouteilles = bouteilles.map((bouteille) => {
                    if (
                        bouteille.id_bouteille === idBouteille &&
                        bouteille.id_cellier === idCellier
                    ) {
                        bouteille.quantite = quantite;
                    }
                    return bouteille;
                });
                setBouteilles(newBouteilles);
            }
        );
    }

    return (
        <React.Fragment>
            <CelliersProvider value={celliers}>
                <BouteillesProvider value={bouteilles}>
                    <Entete />
                    <Main
                        gereQuantite={gereQuantite}
                        gereSelectCellier={gereSelectCellier}
                    />
                    <NavBottom />
                </BouteillesProvider>
            </CelliersProvider>
        </React.Fragment>
    );
}

export default App;
