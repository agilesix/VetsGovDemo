var pcs = {
    score: 0,
    colors: [],
    gray: "#E5E5E5",
    resizeCanvas: function (canvas) {
        canvas.width = pcs.containerWidth;
        canvas.height = pcs.containerHeight;
        canvas.style.width = pcs.containerWidth + 'px';
        canvas.style.height = pcs.containerHeight + 'px';
        pcs.cellWidth = Math.floor(pcs.containerWidth / 100); //width of a cell
        console.log("setting canvas size [width : " + pcs.containerWidth + ", height:" + pcs.containerHeight + "]");
    }
}

pcs.colors[0] = "#FABA01";
pcs.colors[1] = "#FABA01";
pcs.colors[2] = "#FABA01";
pcs.colors[3] = "#FABA01";
pcs.colors[4] = "#FABA01";
pcs.colors[5] = "#FABA01";
pcs.colors[6] = "#FABA01";
pcs.colors[7] = "#FABA01";
pcs.colors[8] = "#FABA01";
pcs.colors[9] = "#FABA01";
pcs.colors[10] = "#FABA01";

pcs.colors[11] = "#FABA01";
pcs.colors[12] = "#FABA01";
pcs.colors[13] = "#FABA01";
pcs.colors[14] = "#FABA01";
pcs.colors[15] = "#FABA01";
pcs.colors[16] = "#FABA01";
pcs.colors[17] = "#FABA01";
pcs.colors[18] = "#FABA01";
pcs.colors[19] = "#FABA01";
pcs.colors[20] = "#FABA01";

pcs.colors[21] = "#FABA01";
pcs.colors[22] = "#FABA01";
pcs.colors[23] = "#FABA01";
pcs.colors[24] = "#FABA01";
pcs.colors[25] = "#FABA01";
pcs.colors[26] = "#FABA01";
pcs.colors[27] = "#FABA01";
pcs.colors[28] = "#FABA01";
pcs.colors[29] = "#FABA01";
pcs.colors[30] = "#FABA01";

pcs.colors[31] = "#E4B507";
pcs.colors[32] = "#E4B507";
pcs.colors[33] = "#E4B507";
pcs.colors[34] = "#E4B507";
pcs.colors[35] = "#E4B507";
pcs.colors[36] = "#E4B507";
pcs.colors[37] = "#E4B507";
pcs.colors[38] = "#E4B507";
pcs.colors[39] = "#E4B507";
pcs.colors[40] = "#E4B507";

pcs.colors[41] = "#E4B507";
pcs.colors[42] = "#E4B507";
pcs.colors[43] = "#E4B507";
pcs.colors[44] = "#E4B507";
pcs.colors[45] = "#E4B507";
pcs.colors[46] = "#E4B507";
pcs.colors[47] = "#ADA514";
pcs.colors[48] = "#ADA514";
pcs.colors[49] = "#ADA514";
pcs.colors[50] = "#ADA514";

pcs.colors[51] = "#ADA514";
pcs.colors[52] = "#ADA514";
pcs.colors[53] = "#749625";
pcs.colors[54] = "#749625";
pcs.colors[55] = "#749625";
pcs.colors[56] = "#749625";
pcs.colors[57] = "#749625";
pcs.colors[58] = "#749625";
pcs.colors[59] = "#378633";
pcs.colors[60] = "#378633";

pcs.colors[61] = "#378633";
pcs.colors[62] = "#378633";
pcs.colors[63] = "#378633";
pcs.colors[64] = "#378633";
pcs.colors[65] = "#378633";
pcs.colors[66] = "#378633";
pcs.colors[67] = "#378633";
pcs.colors[68] = "#378633";
pcs.colors[69] = "#378633";
pcs.colors[70] = "#378633";

pcs.colors[71] = "#378633";
pcs.colors[72] = "#378633";
pcs.colors[73] = "#378633";
pcs.colors[74] = "#378633";
pcs.colors[75] = "#378633";
pcs.colors[76] = "#378633";
pcs.colors[77] = "#378633";
pcs.colors[78] = "#378633";
pcs.colors[79] = "#378633";
pcs.colors[80] = "#378633";

pcs.colors[81] = "#378633";
pcs.colors[82] = "#378633";
pcs.colors[83] = "#378633";
pcs.colors[84] = "#378633";
pcs.colors[85] = "#378633";
pcs.colors[86] = "#378633";
pcs.colors[87] = "#378633";
pcs.colors[88] = "#378633";
pcs.colors[89] = "#378633";
pcs.colors[90] = "#378633";

pcs.colors[91] = "#378633";
pcs.colors[92] = "#378633";
pcs.colors[93] = "#378633";
pcs.colors[94] = "#378633";
pcs.colors[95] = "#378633";
pcs.colors[96] = "#378633";
pcs.colors[97] = "#378633";
pcs.colors[98] = "#378633";
pcs.colors[99] = "#378633";


$(function () {
    $('#city-search').autocomplete({
        minLength: 3,
        source: "/patient_care_scores/cities.json",
        select: function (event, ui) {
            event.preventDefault();
            $("#city-search").val(ui.item.value);
        }
    });

    $('#city-search').keypress(function (e) {
        if ((e.keyCode == 13 || e.which == 13) && !$(this).val()) {
            e.preventDefault();
        }
    });

    $("#search-btn").click(function (e) {
        if (!$('#city-search').val()) {
            e.preventDefault();
        }
    });

    $(window).resize(function () {
        console.log("window resized");
        drawRatingGraph($('div.rbar-container').width(), $('#rbar').height());
    });
});


function roundRect(ctx, p, x, y, width, height, radius, fill, stroke) {
    if (typeof stroke == 'undefined') {
        stroke = true;
    }
    if (typeof radius === 'undefined') {
        radius = 5;
    }
    if (typeof radius === 'number') {
        radius = {tl: radius, tr: radius, br: radius, bl: radius};
    } else {
        var defaultRadius = {tl: 0, tr: 0, br: 0, bl: 0};
        for (var side in defaultRadius) {
            radius[side] = radius[side] || defaultRadius[side];
        }
    }
    ctx.beginPath();
    ctx.moveTo(x + radius.tl, y);
    ctx.lineTo(x + width - radius.tr, y);
    ctx.quadraticCurveTo(x + width, y, x + width, y + radius.tr);
    ctx.lineTo(x + width, y + height - radius.br);
    ctx.quadraticCurveTo(x + width, y + height, x + width - radius.br, y + height);
    ctx.lineTo(x + radius.bl, y + height);
    ctx.quadraticCurveTo(x, y + height, x, y + height - radius.bl);
    ctx.lineTo(x, y + radius.tl);
    ctx.quadraticCurveTo(x, y, x + radius.tl, y);

    //draw the tip of tooltip
    var mid = x + width / 2;
    var bottom = y + height;
    var len = 6;
    ctx.moveTo(mid - len / 2, bottom);
    ctx.lineTo(mid + len / 2, bottom + len);
    ctx.lineTo(mid + len + len / 2, bottom);

    ctx.closePath();
    if (fill) {
        ctx.fill();
    }
    if (stroke) {
        ctx.stroke();
    }

    var tx = x + Math.floor(width / 4);
    var ty = y + Math.floor(height / 2) + 4;
    ctx.font = "12px Verdana";
    ctx.fillStyle = "#FFFFFF";
    ctx.fillText(p + "%", tx, ty);

}


function drawRatingGraph(iw, ih) {
    console.log("drawRatingGraph")
    var p = pcs.score;
    p = 78;
    pcs.containerWidth = Math.floor(iw);
    pcs.containerHeight = Math.floor(ih);




    var canvas = $('#rbar')[0];
    pcs.resizeCanvas(canvas);

    var x = 0;
    var y = Math.floor(pcs.containerHeight / 2) + Math.floor(pcs.containerHeight / 6);
    var w = pcs.cellWidth;
    var h = 8;
    var padding = 15;

    if (canvas.getContext) {
        var ctx = canvas.getContext('2d');
        ctx.clearRect(0, 0, pcs.containerWidth, pcs.containerHeight);

        for (var i = 0; i < 100; i++) {

            var color = pcs.colors[i];

            //draw rect
            ctx.fillStyle = p >= i ? color : pcs.gray;
            ctx.fillRect(x, y, w, h);

            x = x + w;

            if (i == 0) {
                ctx.font = "12px Verdana";
                ctx.fillStyle = "#000000"
                ctx.fillText("0", x, y + h + padding);
            } else if (i == 25) {
                ctx.font = "12px Verdana";
                ctx.fillStyle = "#000000"
                ctx.fillText("25", x, y + h + padding);
            } else if (i == 50) {
                ctx.font = "12px Verdana";
                ctx.fillStyle = "#000000"
                ctx.fillText("50", x, y + h + padding);
            } else if (i == 75) {
                ctx.font = "12px Verdana";
                ctx.fillStyle = "#000000"
                ctx.fillText("75", x, y + h + padding)
            } else if (i == 98) {
                ctx.font = "12px Verdana";
                ctx.fillStyle = "#000000"
                ctx.fillText("100", x, y + h + padding);
            }
        }

        //draw circle
        if (p > 0) {
            ctx.fillStyle = pcs.colors[p];
            x = p * w
            ctx.arc(x + Math.floor(w / 2), y + Math.floor(h / 2), h, 0, 2 * Math.PI);
            ctx.fill();
            var bw = 5 * w;
            var bh = 25;
            var bx = x - bw / 2;
            var by = y - bh - padding;
            var br = 3;
            roundRect(ctx, p, bx, by, bw, bh, br, true, false);
        }


    }

}

