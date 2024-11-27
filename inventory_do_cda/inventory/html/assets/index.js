var inshop, inchest, intrunkchest, inhomeschest, ininspect, intrade = false;
var shopindex = "selectShop";
var shoptype = "buy";
var chestindex = "selectChest";
var trunkchestindex = "selectChest";
var homesindex = "selectChest";
var inspectindex = "selectChest";
var tradeindex = "selectChest";

$(document).ready(function() {
    window.addEventListener("message", function(event) {
        switch (event["data"]["action"]) {
            case "showMenu":
                updateMochila();
                $(".container .row-close").removeClass("row-close").addClass("row");

                $(".containerinvRight #weight").hide();
                $(".invMiddle").show();
                $(".invRight").hide();
                $(".confirm").hide();
                $(".myweight").hide();
                $(".otherweight").hide();
                $("#myTrade").hide();
                $("#otherTrade").hide();
                break;
            case "showMenuId":
                updateMochilaId(event.data.id);
                $(".container .row-close").removeClass("row-close").addClass("row");

                $(".containerinvRight #weight").hide();
                $(".invMiddle").show();
                $(".invRight").hide();
                $(".confirm").hide();
                $(".myweight").hide();
                $(".otherweight").hide();
                $("#myTrade").hide();
                $("#otherTrade").hide();
                break;
            case "showShop":
                inshop = true;
                shopindex = event.data.index;
                shoptype = event.data.type;
                updateMochila();
                updateShop();
                $(".container .row-close").removeClass("row-close").addClass("row");
                break;
            case "showChest":
                inchest = true;
                chestindex = event.data.index;
                updateMochila();
                updateChest();
                $(".container .row-close").removeClass("row-close").addClass("row");
                break;
            case "showTrunkChest":
                intrunkchest = true;
                trunkchestindex = event.data.index;
                updateMochila();
                updateTrunkChest();
                $(".container .row-close").removeClass("row-close").addClass("row");
                break;
            case "showHomesChest":
                inhomeschest = true;
                homesindex = event.data.index;
                updateMochila();
                updateHomesChest();
                $(".container .row-close").removeClass("row-close").addClass("row");
                break;
            case "showInspect":
                ininspect = true;
                inspectindex = event.data.index;
                updateMochila();
                updateInspect();
                $(".container .row-close").removeClass("row-close").addClass("row");
                break;
            case "showTrade":
                intrade = true;
                tradeindex = event.data.index;
                updateMochila();
                updateTrade();
                $(".container .row-close").removeClass("row-close").addClass("row");
                break;

            case "hideMenu":
                inshop = false;
                inchest = false;
                intrunkchest = false;
                inhomeschest = false;
                ininspect = false;
                intrade = false;
                $(".container .row").removeClass("row").addClass("row-close");
                break;

            case "updateMochila":
                updateMochila();
                break;

            case "updateShop":
                updateShop();
                break;

            case "updateChest":
                updateChest();
                break;

            case "updateTrunkChest":
                updateTrunkChest();
                break;

            case "updateHomesChest":
                updateHomesChest();
                break;

            case "updateInspect":
                updateInspect();
                break;

            case "updateTrade":
                updateTrade();
                break;
        }
    });

    document.onkeyup = data => {
        if (data["key"] === "Escape") {
            $.post("http://inventory/invClose");
        }
    };
});

const updateDrag = () => {
    $(".populated").draggable({
        helper: "clone",
        start: function(event, ui) {
            $(ui.helper).css("margin-left", -300);
        }
    });

    $(".empty").droppable({
        hoverClass: "hoverControl",
        drop: function(event, ui) {
            if (ui.draggable.parent()[0] == undefined) return;

            const shiftPressed = event.shiftKey;
            const origin = ui.draggable.parent()[0].className;
            if (origin === undefined) return;
            const tInv = $(this).parent()[0].className;

            if (origin === "invRight" && tInv === "invRight") return;

            itemData = { key: ui.draggable.data("item-key"), slot: ui.draggable.data("slot") };
            const target = $(this).data("slot");

            if (itemData.key === undefined || target === undefined) return;

            let amount = 0;
            let itemAmount = parseInt(ui.draggable.data("amount"));

            if (shiftPressed) {
                amount = itemAmount;
            } else if ($(".amount").val() == "" | parseInt($(".amount").val()) <= 0) {
                amount = 1;

            } else {
                amount = parseInt($(".amount").val());
            }

            if (inshop || inchest || intrunkchest || inhomeschest) {
                amount = amount;
            } else {
                if (amount > itemAmount) {
                    amount = itemAmount;
                }
            }

            $(".populated, .empty, .use").off("draggable droppable");

            let clone1 = ui.draggable.clone();
            let slot2 = $(this).data("slot");

            if (amount == itemAmount) {
                let clone2 = $(this).clone();
                let slot1 = ui.draggable.data("slot");

                $(this).replaceWith(clone1);
                ui.draggable.replaceWith(clone2);

                $(clone1).data("slot", slot2);
                $(clone2).data("slot", slot1);
            } else {
                let newAmountOldItem = itemAmount - amount;
                let weight = parseFloat(ui.draggable.data("peso"));
                let newWeightClone1 = (amount * weight).toFixed(2);
                let newWeightOldItem = (newAmountOldItem * weight).toFixed(2);

                ui.draggable.data("amount", newAmountOldItem);

                clone1.data("amount", amount);

                $(this).replaceWith(clone1);
                $(clone1).data("slot", slot2);

                ui.draggable.children(".top").children(".itemAmount").html(formatarNumero(ui.draggable.data("amount")) + "x");
                ui.draggable.children(".top").children(".itemWeight").html(newWeightOldItem);

                $(clone1).children(".top").children(".itemAmount").html(formatarNumero(clone1.data("amount")) + "x");
                $(clone1).children(".top").children(".itemWeight").html(newWeightClone1);
            }

            updateDrag();

            if (origin === "invLeft" && tInv === "invLeft") {
                $.post("http://inventory/updateSlot", JSON.stringify({
                    item: itemData.key,
                    slot: itemData.slot,
                    target: target,
                    amount: parseInt(amount)
                }));
            }
            if (inshop) {
                if (tInv === "invLeft") {
                    if (origin === "invRight") {
                        $.post("http://inventory/functionShops", JSON.stringify({
                            shop: shopindex,
                            item: itemData.key,
                            slot: target,
                            amount: parseInt(amount)
                        }), (data) => {
                            updateMochila();
                        });
                    }
                } else if (tInv === "invRight") {
                    if (origin === "invLeft" && shoptype === "sell") {
                        $.post("http://inventory/functionShops", JSON.stringify({
                            shop: shopindex,
                            item: itemData.key,
                            slot: itemData.slot,
                            amount: parseInt(amount)
                        }), (data) => {
                            updateMochila();
                        });
                    }
                }
            } else if (inchest) {
                if (tInv === "invLeft") {
                    if (origin === "invRight") {
                        $.post("http://inventory/sumSlot", JSON.stringify({
                            chest: chestindex,
                            item: itemData.key,
                            slot: target,
                            amount: parseInt(amount)
                        }));

                        $('.amount').val("");
                    }
                } else if (tInv === "invRight") {
                    if (origin === "invLeft") {
                        $.post("http://inventory/storeItem", JSON.stringify({
                            chest: chestindex,
                            item: itemData.key,
                            slot: itemData.slot,
                            amount: parseInt(amount)
                        }));

                        $('.amount').val("");
                    }
                }
            } else if (intrunkchest) {
                if (tInv === "invLeft") {
                    if (origin === "invRight") {
                        $.post("http://inventory/sumSlot", JSON.stringify({
                            chest: trunkchestindex,
                            item: itemData.key,
                            slot: target,
                            amount: parseInt(amount)
                        }));

                        $('.amount').val("");
                    }
                } else if (tInv === "invRight") {
                    if (origin === "invLeft") {
                        $.post("http://inventory/storeItem", JSON.stringify({
                            chest: trunkchestindex,
                            item: itemData.key,
                            slot: itemData.slot,
                            amount: parseInt(amount)
                        }));

                        $('.amount').val("");
                    }
                }
            } else if (inhomeschest) {
                if (tInv === "invLeft") {
                    if (origin === "invRight") {
                        $.post("http://inventory/sumSlot", JSON.stringify({
                            chest: homesindex,
                            item: itemData.key,
                            slot: target,
                            amount: parseInt(amount)
                        }));

                        $('.amount').val("");
                    }
                } else if (tInv === "invRight") {
                    if (origin === "invLeft") {
                        $.post("http://inventory/storeItem", JSON.stringify({
                            chest: homesindex,
                            item: itemData.key,
                            slot: itemData.slot,
                            amount: parseInt(amount)
                        }));

                        $('.amount').val("");
                    }
                }
            } else if (ininspect) {
                if (tInv === "invLeft") {
                    if (origin === "invRight") {
                        $.post("http://inventory/sumSlot", JSON.stringify({
                            id: inspectindex,
                            item: itemData.key,
                            slot: target,
                            amount: parseInt(amount)
                        }));

                        $('.amount').val("");
                    }
                } else if (tInv === "invRight") {
                    if (origin === "invLeft") {
                        $.post("http://inventory/storeItem", JSON.stringify({
                            id: inspectindex,
                            item: itemData.key,
                            slot: itemData.slot,
                            amount: parseInt(amount)
                        }));

                        $('.amount').val("");
                    }
                }
            }

            $(".amount").val("");
        }
    });

    $(".populated").droppable({
        hoverClass: "hoverControl",
        drop: function(event, ui) {
            if (ui.draggable.parent()[0] == undefined) return;

            const shiftPressed = event.shiftKey;
            const origin = ui.draggable.parent()[0].className;
            if (origin === undefined) return;
            const tInv = $(this).parent()[0].className;

            if (origin === "invRight" && tInv === "invRight") return;

            itemData = { key: ui.draggable.data("item-key"), slot: ui.draggable.data("slot") };
            const target = $(this).data("slot");

            if (itemData.key === undefined || target === undefined) return;

            let amount = 0;
            let itemAmount = parseInt(ui.draggable.data("amount"));

            if (shiftPressed) {
                amount = itemAmount;

            } else if ($(".amount").val() == "" | parseInt($(".amount").val()) <= 0)
                amount = 1;
            else
                amount = parseInt($(".amount").val());

            if (amount > itemAmount)
                amount = itemAmount;

            $(".populated, .empty, .use").off("draggable droppable");

            if (ui.draggable.data("item-key") == $(this).data("item-key")) {
                let newSlotAmount = amount + parseInt($(this).data("amount"));
                let newSlotWeight = ui.draggable.data("peso") * newSlotAmount;

                $(this).data("amount", newSlotAmount);
                $(this).children(".top").children(".itemAmount").html(formatarNumero(newSlotAmount) + "x");
                $(this).children(".top").children(".itemWeight").html(newSlotWeight.toFixed(2));

                if (amount == itemAmount) {
                    ui.draggable.replaceWith(`<div class="item empty" data-slot="${ui.draggable.data("slot")}"></div>`);
                } else {
                    let newMovedAmount = itemAmount - amount;
                    let newMovedWeight = parseFloat(ui.draggable.data("peso")) * newMovedAmount;

                    ui.draggable.data("amount", newMovedAmount);
                    ui.draggable.children(".top").children(".itemAmount").html(formatarNumero(newMovedAmount) + "x");
                    ui.draggable.children(".top").children(".itemWeight").html(newMovedWeight.toFixed(2));
                }
            } else {
                if (origin === "invRight" && tInv === "invLeft") return;

                let clone1 = ui.draggable.clone();
                let clone2 = $(this).clone();

                let slot1 = ui.draggable.data("slot");
                let slot2 = $(this).data("slot");

                ui.draggable.replaceWith(clone2);
                $(this).replaceWith(clone1);

                $(clone1).data("slot", slot2);
                $(clone2).data("slot", slot1);
            }

            updateDrag();

            if (origin === "invLeft" && tInv === "invLeft") {
                $.post("http://inventory/updateSlot", JSON.stringify({
                    item: itemData.key,
                    slot: itemData.slot,
                    target: target,
                    amount: parseInt(amount)
                }));
            }
            // else if (origin === "invRight" && tInv === "invLeft") {
            //     const id = ui.draggable.data("id");
            //     $.post("http://inventory/pickupItem", JSON.stringify({
            //         id: id,
            //         target: target,
            //         amount: parseInt(amount)
            //     }));
            // } else if (origin === "invLeft" && tInv === "invRight") {
            //     $.post("http://inventory/dropItem", JSON.stringify({
            //         item: itemData.key,
            //         slot: itemData.slot,
            //         amount: parseInt(amount)
            //     }));
            // }

            $(".amount").val("");
        }
    });

    $(".use").droppable({
        hoverClass: "hoverControl",
        drop: function(event, ui) {
            if (ui.draggable.parent()[0] == undefined) return;

            const shiftPressed = event.shiftKey;
            const origin = ui.draggable.parent()[0].className;
            if (origin === undefined || origin === "invRight") return;
            itemData = { key: ui.draggable.data("item-key"), slot: ui.draggable.data("slot") };

            if (itemData.key === undefined) return;

            let amount = $(".amount").val();
            if (shiftPressed) amount = ui.draggable.data("amount");

            $.post("http://inventory/useItem", JSON.stringify({
                slot: itemData.slot,
                amount: parseInt(amount)
            }));

            $(".amount").val("");
        }
    });

    $(".populated").on("auxclick", e => {
        if (e["which"] === 3) {
            const item = e["target"];
            const shiftPressed = event.shiftKey;
            const origin = $(item).parent()[0].className;
            if (origin === undefined || origin === "invRight") return;

            itemData = { key: $(item).data("item-key"), slot: $(item).data("slot") };

            if (itemData.key === undefined) return;

            let amount = $(".amount").val();
            if (shiftPressed) amount = $(item).data("amount");

            $.post("http://inventory/useItem", JSON.stringify({
                slot: itemData.slot,
                amount: parseInt(amount)
            }));
        }
    });

    $('.send').droppable({
        hoverClass: 'hoverControl',
        drop: function(event, ui) {
            const origin = ui.draggable.parent()[0].className;
            if (origin === undefined || origin === "invRight") return;
            itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };

            if (itemData.key === undefined) return;

            $.post("http://inventory/sendItem", JSON.stringify({
                item: itemData.key,
                slot: itemData.slot,
                amount: parseInt(parseInt($(".amount").val()))
            }));

            $('.amount').val("");
        }
    });

    $('.drop').droppable({
        hoverClass: 'hoverControl',
        drop: function(event, ui) {
            const shiftPressed = event.shiftKey;
            const origin = ui.draggable.parent()[0].className;
            if (origin === undefined || origin === "invRight") return;
            itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };

            if (itemData.key === undefined) return;

            let amount = 0;
            let itemAmount = parseInt(ui.draggable.data("amount"));

            if (shiftPressed)
                amount = itemAmount;
            else if ($(".amount").val() == "" | parseInt($(".amount").val()) <= 0)
                amount = 1;
            else
                amount = parseInt($(".amount").val());

            if (amount > itemAmount)
                amount = itemAmount;

            $.post("http://inventory/dropItem", JSON.stringify({
                item: itemData.key,
                slot: itemData.slot,
                amount: parseInt(amount)
            }));

            $('.amount').val("");
        }
    });

    $(".populated").tooltip({
        create: function(event, ui) {
            var serial = $(this).attr("data-serial");
            var economy = $(this).attr("data-economy");
            var desc = $(this).attr("data-desc");
            var amounts = $(this).attr("data-amount");
            var name = $(this).attr("data-name-key");
            var weight = $(this).attr("data-peso");
            var tipo = $(this).attr("data-tipo");
            var unity = $(this).attr("data-unity");
            var myLeg = "center top-196";

            if (tipo == "undefined") {
                tipo = "Não definido"
            }

            if (economy == "undefined") {
                economy = "S/V"
            }

            if (desc !== "undefined") {
                myLeg = "center top-219";
            }

            $(this).tooltip({
                content: `<item>${name}</item>${desc !== "undefined" ? "<br><description>"+desc+"</description>":""}<br><legenda>${serial !== "undefined" ? "Serial: <r>"+serial+"</r>":"Tipo: <r>"+tipo+"</r>"} <s>|</s> Unitário: <r>${unity !== "undefined" ? unity:"S/L"}</r><br>Peso: <r>${(weight * amounts).toFixed(2)}</r> <s>|</s> Economia: <r>${economy !== "S/V" ? "$"+formatarNumero(economy):economy}</r></legenda>`,
                position: { my: myLeg, at: "center" },
                show: { duration: 10 },
                hide: { duration: 10 }
            })
        }
    });
}

const colorPicker = (percent) => {
    var colorPercent = "rgb(227, 255, 56)";

    if (percent >= 100)
        colorPercent = "rgba(255,255,255,0)";

    if (percent >= 33 && percent <= 66)
        colorPercent = "background: rgb(249, 176, 54)";

    if (percent <= 33)
        colorPercent = "#fc5858";

    return colorPercent;
}

const updateMochila = () => {
    $.post("http://inventory/requestMochila", JSON.stringify({}), (data) => {
        $(".backpack-weight-text").html(`${(data["peso"]).toFixed(2)} / ${(data["maxpeso"]).toFixed(2)} kg`);

        $("#weightBarLeft").html(`<div id="weightContent" style="width: ${data["peso"] / data["maxpeso"] * 100}%"></div>`);

        $(".items-list").html("");

        if (data.infos) {
            $(".information .details .name").html(data.infos.name);
            $(".information .details .phone").html(data.infos.phone);
            $(".information .details .id").html(data.infos.user_id);
        } else {
            $(".information .details .name").html("Error");
            $(".information .details .phone").html("Error");
            $(".information .details .id").html("Error");
        }

        for (let x = 1; x <= data["slots"]; x++) {
            const slot = x.toString();

            if (data["inventario"][slot] !== undefined) {
                const v = data["inventario"][slot];
                let actualPercent = 0;
                let durability = true;
                let durabilitycss = "";
                if (v["days"]) {
                    const maxDurability = 86400 * v["days"];
                    const newDurability = (maxDurability - v["durability"]) / maxDurability;
                    actualPercent = newDurability * 100;
                } else {
                    actualPercent = v["durability"] * 100;
                    if (actualPercent < 5.0) {
                        actualPercent = 5.0
                    }
                }

                if (isNaN(actualPercent)) {
                    actualPercent = 0;
                    durability = false
                }

                if (durability) {
                    durabilitycss = `<div color="#E3FF38" class="item-durability"><div style="height: ${parseInt(actualPercent)}%; background: ${colorPicker(actualPercent)};"></div></div>`;
                }

                const item = `<div id="container" class="item-slot populated" title="" data-unity="${v["unity"]}" data-tipo="${v["tipo"]}" data-serial="${v["serial"]}" data-amount="${v["amount"]}" data-peso="${v["peso"]}" data-item-key="${v["key"]}" data-name-key="${v["name"]}" data-slot="${slot}" data-desc="${v["desc"]}" data-economy="${v["economy"]}" style="opacity: 1; transform: none;">
                    <div class="item-image" style="background-image: url('${data.ipimages}${v.index}.png'); background-position: center; background-repeat: no-repeat; background-size: contain;"></div>
                    <div class="item-qtd qtd">
                        <p size="100" type="bold" class="item-qtd-text">${formatarNumero(v["amount"])}x</p>
                    </div>
					${durabilitycss}
				</div>`;

                $(".items-list").append(item);
            } else {
                const item = `<div id="container" data-slot="${slot}" class="item-slot empty" style="opacity: 1; transform: none;"></div>`;
                // const item = `<div class="item empty" data-slot="${slot}"></div>`;

                $(".items-list").append(item);
            }
        }

        if (data["slots"] < 24) {
            var faketotal = 24;

            var init = data["slots"] + 1

            for (let x = init; x <= faketotal; x++) {
                const slot = x.toString();
                const item = `<div id="container" data-slot="${slot}" class="item-slot empty"></div>`;

                $(".items-list").append(item);
            }
        }

        updateDrag();
    });
}

const updateMochilaId = (id) => {
    $.post("http://inventory/requestMochila", JSON.stringify({ id: id }), (data) => {
        $(".containerinvLeft .kgs").html(`${(data["peso"]).toFixed(2)}KG - ${(data["maxpeso"]).toFixed(2)}KG`);

        $("#weightBarLeft").html(`<div id="weightContent" style="width: ${data["peso"] / data["maxpeso"] * 100}%"></div>`);

        $(".invLeft").html("");

        if (data.infos) {
            $(".info-name").html(data.infos.name);
            $(".info-id").html("#" + data.infos.user_id);
            $(".info-bank").html(data.infos.bank);
            $(".info-registration").html(data.infos.registration);
            $(".info-age").html(data.infos.age);
            $(".info-fines").html(data.infos.fines);
            $(".info-profission").html(data.infos.profission);
            $(".info-vip").html(data.infos.vip);
        } else {
            $(".info-name").html("Error");
            $(".info-id").html("Error");
            $(".info-bank").html("Error");
            $(".info-registration").html("Error");
            $(".info-age").html("Error");
            $(".info-fines").html("Error");
            $(".info-profission").html("Error");
            $(".info-vip").html("Error");
        }

        for (let x = 1; x <= data["slots"]; x++) {
            const slot = x.toString();

            if (data["inventario"][slot] !== undefined) {
                const v = data["inventario"][slot];
                let actualPercent = 0;
                if (v["days"]) {
                    const maxDurability = 86400 * v["days"];
                    const newDurability = (maxDurability - v["durability"]) / maxDurability;
                    actualPercent = newDurability * 100;
                } else {
                    actualPercent = v["durability"] * 100;
                    if (actualPercent < 5.0) {
                        actualPercent = 5.0
                    }
                }

                if (isNaN(actualPercent)) {
                    actualPercent = 0;
                }

                const item = `<div class="item populated" title="" data-unity="${v["unity"]}" data-tipo="${v["tipo"]}" data-serial="${v["serial"]}" style="background-image: url('${data.ipimages}${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-amount="${v["amount"]}" data-peso="${v["peso"]}" data-item-key="${v["key"]}" data-name-key="${v["name"]}" data-slot="${slot}" data-desc="${v["desc"]}" data-economy="${v["economy"]}">
					<div class="top">
						<div class="itemWeight">${(v["peso"] * v["amount"]).toFixed(2)}</div>
						<div class="itemAmount">${formatarNumero(v["amount"])}x</div>
					</div>
                    <div class="nameItem">${v["name"]}</div>
					<div class="durability" style="width: ${parseInt(actualPercent)}%; background: ${colorPicker(actualPercent)};"></div>
					
				</div>`;

                $(".invLeft").append(item);
            } else {
                const item = `<div class="item empty" data-slot="${slot}"></div>`;

                $(".invLeft").append(item);
            }
        }
        updateDrag();
    });
}

const updateShop = () => {
    $.post("http://inventory/requestShop", JSON.stringify({ shop: shopindex }), (data) => {
        $(".invRight").html("");

        const nameList2 = data["itens"].sort((a, b) => (a["name"] > b["name"]) ? 1 : -1);

        for (let x = 1; x <= data["itens"].length; x++) {
            const slot = x.toString();

            if (nameList2[x - 1] !== undefined) {
                const v = nameList2[x - 1];

                const item = `<div class="item populated" title="" data-unity="${v["unity"]}" data-tipo="${v["tipo"]}" data-serial="${v["serial"]}" style="background-image: url('${data.ipimages}${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v["key"]}" data-name-key="${v["name"]}" data-id="${v["key"]}" data-amount="1" data-peso="${v["weight"]}" data-slot="${slot}" data-desc="${v["desc"] !== "undefined" ? v["desc"]:""}" data-economy="${v["economy"]}">
					<div class="top">
						<div class="itemWeight">${(v["weight"]).toFixed(2)}</div>
						<div class="itemAmount">$${formatarNumero(v["price"])}</div>
					</div>

					<div class="invisibledurability"></div>
					<div class="nameItem">${v["name"]}</div>
				</div>`;

                $(".invRight").append(item);
            } else {
                const item = `<div class="item empty" data-slot="${slot}"></div>`;

                $(".invRight").append(item);
            }
        }

        $(".invMiddle").hide();
        $(".invRight").show();
    });
}

const updateChest = () => {
    $.post("http://inventory/requestChest", JSON.stringify({ chest: chestindex }), (data) => {
        $(".containerinvRight #weight").show();
        $(".containerinvRight .kgs").html(`${(data["peso"]).toFixed(2)}KG - ${(data["weight"]).toFixed(2)}KG`);

        $("#weightBarRight").html(`<div id="weightContent" style="width: ${data["peso"] / data["weight"] * 100}%"></div>`);

        $(".invRight").html("");

        const nameList2 = data["itens"].sort((a, b) => (a["name"] > b["name"]) ? 1 : -1);

        for (let x = 1; x <= data["slots"]; x++) {
            const slot = x.toString();

            if (nameList2[x - 1] !== undefined) {
                const v = nameList2[x - 1];

                let actualPercent = 0;
                if (v["days"]) {
                    const maxDurability = 86400 * v["days"];
                    const newDurability = (maxDurability - v["durability"]) / maxDurability;
                    actualPercent = newDurability * 100;
                } else {
                    actualPercent = v["durability"] * 100;
                }

                if (isNaN(actualPercent)) {
                    actualPercent = 0;
                }

                const item = `<div class="item populated" title="" data-unity="${v["unity"]}" data-tipo="${v["tipo"]}" data-serial="${v["serial"]}" style="background-image: url('${data.ipimages}${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v["key"]}" data-name-key="${v["name"]}" data-id="${v["key"]}" data-amount="1" data-peso="${v["weight"]}" data-slot="${slot}" data-desc="${v["desc"] !== "undefined" ? v["desc"]:""}" data-economy="${v["economy"]}">
					<div class="top">
						<div class="itemWeight">${(v["weight"]).toFixed(2)}</div>
						<div class="itemAmount">${formatarNumero(v["amount"])}x</div>
					</div>

					<div class="nameItem">${v["name"]}</div>
					<div class="durability" style="width: ${parseInt(actualPercent)}%; background: ${colorPicker(actualPercent)};"></div>
				</div>`;

                $(".invRight").append(item);
            } else {
                const item = `<div class="item empty" data-slot="${slot}"></div>`;

                $(".invRight").append(item);
            }
        }

        updateDrag();

        $(".invMiddle").hide();
        $(".invRight").show();
    });
}

const updateTrunkChest = () => {
    $.post("http://inventory/requestTrunkChest", JSON.stringify({}), (data) => {
        $(".containerinvRight #weight").show();
        $(".containerinvRight .kgs").html(`${(data["peso"]).toFixed(2)}KG - ${(data["weight"]).toFixed(2)}KG`);

        $("#weightBarRight").html(`<div id="weightContent" style="width: ${data["peso"] / data["weight"] * 100}%"></div>`);

        $(".invRight").html("");

        const nameList2 = data["itens"].sort((a, b) => (a["name"] > b["name"]) ? 1 : -1);

        for (let x = 1; x <= data["slots"]; x++) {
            const slot = x.toString();

            if (nameList2[x - 1] !== undefined) {
                const v = nameList2[x - 1];

                let actualPercent = 0;
                if (v["days"]) {
                    const maxDurability = 86400 * v["days"];
                    const newDurability = (maxDurability - v["durability"]) / maxDurability;
                    actualPercent = newDurability * 100;
                } else {
                    actualPercent = v["durability"] * 100;
                }

                if (isNaN(actualPercent)) {
                    actualPercent = 0;
                }

                const item = `<div class="item populated" title="" data-unity="${v["unity"]}" data-tipo="${v["tipo"]}" data-serial="${v["serial"]}" style="background-image: url('${data.ipimages}${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v["key"]}" data-name-key="${v["name"]}" data-id="${v["key"]}" data-amount="1" data-peso="${v["weight"]}" data-slot="${slot}" data-desc="${v["desc"] !== "undefined" ? v["desc"]:""}" data-economy="${v["economy"]}">
					<div class="top">
						<div class="itemWeight">${(v["weight"]).toFixed(2)}</div>
						<div class="itemAmount">${formatarNumero(v["amount"])}x</div>
					</div>

					<div class="nameItem">${v["name"]}</div>
					<div class="durability" style="width: ${parseInt(actualPercent)}%; background: ${colorPicker(actualPercent)};"></div>
				</div>`;

                $(".invRight").append(item);
            } else {
                const item = `<div class="item empty" data-slot="${slot}"></div>`;

                $(".invRight").append(item);
            }
        }

        updateDrag();

        $(".invMiddle").hide();
        $(".invRight").show();
    });
}

const updateHomesChest = () => {
    $.post("http://inventory/requestHomesChest", JSON.stringify({ home: homesindex }), (data) => {
        $(".containerinvRight #weight").show();
        $(".containerinvRight .kgs").html(`${(data["peso"]).toFixed(2)}KG - ${(data["weight"]).toFixed(2)}KG`);

        $("#weightBarRight").html(`<div id="weightContent" style="width: ${data["peso"] / data["weight"] * 100}%"></div>`);

        $(".invRight").html("");

        const nameList2 = data["itens"].sort((a, b) => (a["name"] > b["name"]) ? 1 : -1);

        for (let x = 1; x <= data["slots"]; x++) {
            const slot = x.toString();

            if (nameList2[x - 1] !== undefined) {
                const v = nameList2[x - 1];

                let actualPercent = 0;
                if (v["days"]) {
                    const maxDurability = 86400 * v["days"];
                    const newDurability = (maxDurability - v["durability"]) / maxDurability;
                    actualPercent = newDurability * 100;
                } else {
                    actualPercent = v["durability"] * 100;
                }

                if (isNaN(actualPercent)) {
                    actualPercent = 0;
                }

                const item = `<div class="item populated" title="" data-unity="${v["unity"]}" data-tipo="${v["tipo"]}" data-serial="${v["serial"]}" style="background-image: url('${data.ipimages}${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-item-key="${v["key"]}" data-name-key="${v["name"]}" data-id="${v["key"]}" data-amount="1" data-peso="${v["weight"]}" data-slot="${slot}" data-desc="${v["desc"] !== "undefined" ? v["desc"]:""}" data-economy="${v["economy"]}">
					<div class="top">
						<div class="itemWeight">${(v["weight"]).toFixed(2)}</div>
						<div class="itemAmount">${formatarNumero(v["amount"])}x</div>
					</div>

					<div class="nameItem">${v["name"]}</div>
					<div class="durability" style="width: ${parseInt(actualPercent)}%; background: ${colorPicker(actualPercent)};"></div>
				</div>`;

                $(".invRight").append(item);
            } else {
                const item = `<div class="item empty" data-slot="${slot}"></div>`;

                $(".invRight").append(item);
            }
        }

        updateDrag();

        $(".invMiddle").hide();
        $(".invRight").show();
    });
}

const updateInspect = () => {
    $.post("http://inventory/requestMochila", JSON.stringify({ id: inspectindex }), (data) => {
        $(".containerinvRight #weight").show();
        $(".containerinvRight .kgs").html(`${(data["peso"]).toFixed(2)}KG - ${(data["maxpeso"]).toFixed(2)}KG`);

        $("#weightBarRight").html(`<div id="weightContent" style="width: ${data["peso"] / data["maxpeso"] * 100}%"></div>`);

        $(".invRight").html("");

        for (let x = 1; x <= data["slots"]; x++) {
            const slot = x.toString();

            if (data["inventario"][slot] !== undefined) {
                const v = data["inventario"][slot];
                let actualPercent = 0;
                if (v["days"]) {
                    const maxDurability = 86400 * v["days"];
                    const newDurability = (maxDurability - v["durability"]) / maxDurability;
                    actualPercent = newDurability * 100;
                } else {
                    actualPercent = v["durability"] * 100;
                    if (actualPercent < 5.0) {
                        actualPercent = 5.0
                    }
                }

                if (isNaN(actualPercent)) {
                    actualPercent = 0;
                }

                const item = `<div class="item populated" title="" data-unity="${v["unity"]}" data-tipo="${v["tipo"]}" data-serial="${v["serial"]}" style="background-image: url('${data.ipimages}${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-amount="${v["amount"]}" data-peso="${v["peso"]}" data-item-key="${v["key"]}" data-name-key="${v["name"]}" data-slot="${slot}" data-desc="${v["desc"]}" data-economy="${v["economy"]}">
					<div class="top">
						<div class="itemWeight">${(v["peso"] * v["amount"]).toFixed(2)}</div>
						<div class="itemAmount">${formatarNumero(v["amount"])}x</div>
					</div>
                    <div class="nameItem">${v["name"]}</div>
					<div class="durability" style="width: ${parseInt(actualPercent)}%; background: ${colorPicker(actualPercent)};"></div>
					
				</div>`;

                $(".invRight").append(item);
            } else {
                const item = `<div class="item empty" data-slot="${slot}"></div>`;

                $(".invRight").append(item);
            }
        }

        updateDrag();

        $(".invMiddle").hide();
        $(".invRight").show();
    });
}

const updateTrade = () => {
    $.post("http://inventory/requestTrade", JSON.stringify({ id: tradeindex }), (data) => {

        $("#otherTrade").html("");

        const tradeitens = data["trade"].itens;
        const tradeamount = data["trade"].amount;
        const nameList2 = tradeitens.sort((a, b) => (a["name"] > b["name"]) ? 1 : -1);

        for (let x = 1; x <= 8; x++) {
            const slot = x.toString();

            if (nameList2[x - 1] !== undefined) {
                const v = nameList2[x - 1];
                let actualPercent = 0;
                if (v["days"]) {
                    const maxDurability = 86400 * v["days"];
                    const newDurability = (maxDurability - v["durability"]) / maxDurability;
                    actualPercent = newDurability * 100;
                } else {
                    actualPercent = v["durability"] * 100;
                    if (actualPercent < 5.0) {
                        actualPercent = 5.0
                    }
                }

                if (isNaN(actualPercent)) {
                    actualPercent = 0;
                }

                const item = `<div class="item populated" title="" data-unity="${v["unity"]}" data-tipo="${v["tipo"]}" data-serial="${v["serial"]}" style="background-image: url('${data.ipimages}${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-amount="${v["amount"]}" data-peso="${v["peso"]}" data-item-key="${v["key"]}" data-name-key="${v["name"]}" data-slot="${slot}" data-desc="${v["desc"]}" data-economy="${v["economy"]}">
					<div class="top">
						<div class="itemWeight">${(v["peso"] * v["amount"]).toFixed(2)}</div>
						<div class="itemAmount">${formatarNumero(v["amount"])}x</div>
					</div>
                    <div class="nameItem">${v["name"]}</div>
					<div class="durability" style="width: ${parseInt(actualPercent)}%; background: ${colorPicker(actualPercent)};"></div>
					
				</div>`;

                $("#otherTrade").append(item);
            } else {
                const item = `<div class="item empty" data-slot="${slot}"></div>`;

                $("#otherTrade").append(item);
            }

            $(".otherplayer").html(`Itens de ${data["name"]} #${tradeindex}`);
        }

        $("#myTrade").html("");

        const mytradeitens = data["mytrade"].itens;
        const mytradeamount = data["mytrade"].amount;
        const nameList = mytradeitens.sort((a, b) => (a["name"] > b["name"]) ? 1 : -1);

        for (let x = 1; x <= 8; x++) {
            const slot = x.toString();

            if (nameList[x - 1] !== undefined) {
                const v = nameList[x - 1];
                let actualPercent = 0;
                if (v["days"]) {
                    const maxDurability = 86400 * v["days"];
                    const newDurability = (maxDurability - v["durability"]) / maxDurability;
                    actualPercent = newDurability * 100;
                } else {
                    actualPercent = v["durability"] * 100;
                    if (actualPercent < 5.0) {
                        actualPercent = 5.0
                    }
                }

                if (isNaN(actualPercent)) {
                    actualPercent = 0;
                }

                const item = `<div class="item populated" title="" data-unity="${v["unity"]}" data-tipo="${v["tipo"]}" data-serial="${v["serial"]}" style="background-image: url('${data.ipimages}${v.index}.png'); background-position: center; background-repeat: no-repeat;" data-amount="${v["amount"]}" data-peso="${v["peso"]}" data-item-key="${v["key"]}" data-name-key="${v["name"]}" data-slot="${slot}" data-desc="${v["desc"]}" data-economy="${v["economy"]}">
                <div class="top">
                    <div class="itemWeight">${(v["peso"] * v["amount"]).toFixed(2)}</div>
                    <div class="itemAmount">${formatarNumero(v["amount"])}x</div>
                </div>
                <div class="nameItem">${v["name"]}</div>
                <div class="durability" style="width: ${parseInt(actualPercent)}%; background: ${colorPicker(actualPercent)};"></div>
                
            </div>`;

                $("#myTrade").append(item);
            } else {
                const item = `<div class="item empty" data-slot="${slot}"></div>`;

                $("#myTrade").append(item);
            }
        }

        updateDrag();
        $(".confirm").show();
        $(".myweight").show();
        $(".otherweight").show();

        $(".invMiddle").hide();
        $("#myTrade").show();
        $("#otherTrade").show();
    });
}

/* ----------FORMATARNUMERO---------- */
const formatarNumero = (n) => {
    var n = n.toString();
    var r = '';
    var x = 0;

    for (var i = n.length; i > 0; i--) {
        r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? '.' : '');
        x = x == 2 ? 0 : x + 1;
    }

    return r.split('').reverse().join('');
}

function somenteNumeros(e) {
    var charCode = e.charCode ? e.charCode : e.keyCode;
    if (charCode != 8 && charCode != 9) {
        var max = 9;
        var num = $(".amount").val();

        if ((charCode < 48 || charCode > 57) || (num.length >= max)) {
            return false;
        }
    }
}

$(document).ready(function() {
    var ctrlDown = false,
        ctrlKey = 17,
        cmdKey = 91,
        vKey = 86,
        cKey = 67;

    $(document).keydown(function(e) {
        if (e.keyCode == ctrlKey || e.keyCode == cmdKey) ctrlDown = true;
    }).keyup(function(e) {
        if (e.keyCode == ctrlKey || e.keyCode == cmdKey) ctrlDown = false;
    });

    $(".amount").keydown(function(e) {
        if (ctrlDown && (e.keyCode == vKey || e.keyCode == cKey)) return false;
    });

    $(document).keydown(function(e) {
        if (ctrlDown && (e.keyCode == cKey)) console.log("Document catch Ctrl+C");
        if (ctrlDown && (e.keyCode == vKey)) console.log("Document catch Ctrl+V");
    });
});














var progressContainer = document.querySelectorAll('.skill-container .progress-container');

for (var el of progressContainer) {
    var dataValue = el.getAttribute("data-value");
    var progressValue = el.querySelector(".progress-value");
    var valueContainer = el.querySelector("span");
    var radius = progressValue.getAttribute("r");
    var circumference = 2 * radius * Math.PI;

    progressValue.style.strokeDasharray = circumference;

    progress(dataValue);
}

function progress(dataValue) {
    var progress = dataValue / 100;
    var dashoffset = circumference * (1 - progress);

    // TODO: Remove before entering into production
    progressValue.style.strokeDashoffset = dashoffset;

    // valueContainer is innerHTML of span
    animateValue(valueContainer, 0, dataValue, 1500);
}

function animateValue(selector, start, end, duration) {
    var obj = selector;
    var range = end - start;

    // no timer shorter than 50ms (not really visible any way)
    var minTimer = 50;
    // calc step time to show all interediate values
    var stepTime = Math.abs(Math.floor(duration / range));
    // never go below minTimer
    stepTime = Math.max(stepTime, minTimer);
    // get current time and calculate desired end time
    var startTime = new Date().getTime();
    var endTime = startTime + duration;
    var timer;

    function run() {
        var now = new Date().getTime();
        var remaining = Math.max((endTime - now) / duration, 0);
        var value = Math.round(end - remaining * range);
        obj.innerHTML = value + "%";

        if (value == end) {
            clearInterval(timer);
        }
    }

    var timer = setInterval(run, stepTime);
    run();
}