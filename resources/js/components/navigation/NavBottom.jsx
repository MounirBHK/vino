import * as React from "react";
import NavBottom from "./NavBottom.scss";
import Fab from "@mui/material/Fab";
import { useNavigate } from "react-router-dom";
import Box from "@mui/material/Box";
import Backdrop from "@mui/material/Backdrop";
import SpeedDial from "@mui/material/SpeedDial";
import SpeedDialIcon from "@mui/material/SpeedDialIcon";
import SpeedDialAction from "@mui/material/SpeedDialAction";
import BottomNavigation from "@mui/material/BottomNavigation";
import BottomNavigationAction from "@mui/material/BottomNavigationAction";
import SearchOutlinedIcon from "@mui/icons-material/SearchOutlined";
import AccountCircleOutlinedIcon from "@mui/icons-material/AccountCircleOutlined";
import FavoriteBorderOutlinedIcon from "@mui/icons-material/FavoriteBorderOutlined";
import SettingsOutlinedIcon from "@mui/icons-material/SettingsOutlined";
import CircularProgress from "@mui/material/CircularProgress";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
    faUserCircle,
    faWineBottle,
    faDungeon,
    faPowerOff,
} from "@fortawesome/free-solid-svg-icons";

export default function SimpleBottomNavigation({
    gereDeconnexion,
    userLoggedIn,
}) {
    const [value, setValue] = React.useState(0);
    const navigate = useNavigate();

    const [open, setOpen] = React.useState(false);
    const handleOpen = () => setOpen(true);
    const handleClosed = () => setOpen(false);

    function handleClose(name) {
        handleClosed();
        navigate(`/dashboard/ajout${name}`, {});
    }

    const actions = [
        {
            icon: <FontAwesomeIcon icon={faWineBottle} />,
            name: "Bouteille",
            titre: "Ajouter bouteille",
        },
        {
            icon: <FontAwesomeIcon icon={faDungeon} />,
            name: "Cellier",
            titre: "Ajouter cellier",
        },
    ];

    return (
        <div className="NavBottom">
            <BottomNavigation
                showLabels
                value={value}
                onChange={(events, newValue) => {
                    setValue(newValue);
                }}
            >
                <BottomNavigationAction
                    label="Profil"
                    icon={
                        <FontAwesomeIcon
                            className="navIcon"
                            icon={faUserCircle}
                        />
                    }
                    onClick={() => {
                        navigate(`/dashboard/profil`, {});
                    }}
                />
                <BottomNavigationAction
                    label="Celliers"
                    icon={
                        <FontAwesomeIcon className="navIcon" icon={faDungeon} />
                    }
                    onClick={() => {
                        navigate(`/dashboard/celliers`, {});
                    }}
                />
                <BottomNavigationAction
                    label="Déconnexion"
                    icon={
                        <FontAwesomeIcon
                            className="navIcon"
                            icon={faPowerOff}
                        />
                    }
                    onClick={() => gereDeconnexion(userLoggedIn)}
                />
            </BottomNavigation>
            <Backdrop
                sx={{ color: "#fff" }}
                open={open}
                onClick={handleClosed}
            ></Backdrop>
            <SpeedDial
                role="menu"
                ariaLabel="Ajouter"
                icon={<SpeedDialIcon />}
                onClose={handleClosed}
                onOpen={handleOpen}
                open={open}
            >
                {actions.map((action) => (
                    <SpeedDialAction
                        key={action.name}
                        icon={action.icon}
                        tooltipTitle={action.titre}
                        tooltipPlacement="bottom"
                        role="menuitem"
                        tooltipOpen
                        onClick={() => handleClose(action.name)}
                    />
                ))}
            </SpeedDial>
        </div>
    );
}
