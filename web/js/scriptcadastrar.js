/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

jQuery(document).ready(function ($) {





    $("#inputconfSenha").on('blur', function (e) {
        const valorconfsenha = $("#inputconfSenha").val();
        const valorsenha = $("#inputsenha").val();
        verificaSenha(valorsenha, valorconfsenha);
    });
});

function verificaSenha(senha, confsenha) {
    if (senha !== confsenha) {
        alert("As senhas não conferem!");
        return;
    }
}