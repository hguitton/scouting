import { Controller } from "stimulus";
import * as moment from 'moment';
window.moment = moment;
import Tabulator from 'tabulator-tables';

export default class extends Controller {
    connect() {
        var jsonData = 'players.json';

        //define table
        var table = new Tabulator("#bob", {
            columns: [
                {
                    title: "Last update", field: "updated_at", formatter: "datetimediff", formatterParams: {
                        //inputFormat: "YYYY-MM-DD",
                        humanize: true,
                        invalidPlaceholder: "(invalid date)",
                    }
                },
                { title: "Name", field: "name", },
                {
                    title: "Age", field: "birthdate", formatter: "datetimediff", formatterParams: {
                        inputFormat: "DD-MM-YYYY",
                        humanize: true,
                        invalidPlaceholder: "(invalid date)",
                    }
                },
                {
                    title: "Height", columns: [
                        { title: "Height_eu", field: "height_eu" },
                        { title: "Height_us", field: "height_us" },
                    ],
                },
                { title: "Weight", field: "weight_eu", },
                { title: "status", field: "status", formatter: this.formatName },
                //{ title: "Nat.", field: "nationality", },
                { title: "Pos.", field: "position", formatter: this.formatName },
                { title: "Profiles", field: "profiles", formatter: this.formatArrayName },
                { title: "Salary", field: "salary_real", },
                //{ title: "Agent", field: "agent", },
                { title: "Last season", field: "seasons", formatter: this.formatSeason },
                {
                    title: "Comments", field: "comments", formatter: this.formatComments, cellClick: function (e, cell) {
                        window.alert(cell.getValue());
                    },
                },
                //{ title: "Priority", field: "priority", },
                { title: "Available", field: "available", formatter: "tickCross" },
            ]
        });
        table.setData(jsonData);
    }

    formatName(cell, formatterParams, onRendered) {
        var valueReturn = "";
        if (cell.getValue() != null)
            valueReturn = cell.getValue().name;
        return valueReturn
    }

    formatSeason(cell, formatterParams, onRendered) {
        var valueReturn = "";
        if (cell.getValue() != null) {
            cell.getValue().forEach(element => valueReturn += element.name + ' <br/> ' + element.country + ' <br/> ' + element.team);
        }
        return valueReturn;
    }

    formatArrayName(cell, formatterParams, onRendered) {
        var valueReturn = "";
        if (cell.getValue() != null) {
            cell.getValue().forEach(element => valueReturn += element.name + ' <br/> ');
        }
        return valueReturn;
    }

    formatComments(cell, formatterParams, onRendered) {
        var valueReturn = "";
        if (cell.getValue() != null) {
            valueReturn = cell.getValue().length + " comments";
        }
        return valueReturn;
    }
}