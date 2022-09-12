import './Bouteille.scss';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemText from '@mui/material/ListItemText';
import * as React from 'react';
import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemAvatar from '@mui/material/ListItemAvatar';
import Avatar from '@mui/material/Avatar';
import Typography from '@mui/material/Typography';



export default function Bouteille({id_bouteille, image, nom_bouteille, code_saq, description}) {

    return (
        <>
            <ListItemButton >
                <List sx={{ width: '100%'}}>
                    <ListItem alignItems="flex-start">
                    <ListItemAvatar>
                        <Avatar alt="image bouteille" src={image} />
                    </ListItemAvatar>
                    <ListItemText
                        primary={nom_bouteille}
                        secondary={
                        <React.Fragment>
                            <Typography
                            sx={{ display: 'inline' }}
                            component="span"
                            variant="body2"
                            color="text.primary"
                            >
                            {code_saq}
                            </Typography>
                            {" — "}{description}
                        </React.Fragment>
                        }
                    />
                    </ListItem>
                </List>
            </ListItemButton>
            
        </>
    );
}
