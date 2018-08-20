<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/kinone/resources/js/jquery-barcode.js"></script>
    <div id="bcTarget"></div>


<script type="text/javascript">
    $("#bcTarget").barcode("${rcode}", "code39");

    //    ���ڵ� Ÿ��
    //    codabar
    //    code11 (code 11)
    //    code39 (code 39)
    //    code93 (code 93)
    //    code128 (code 128)
    //    ean8 (ean 8)
    //    ean13 (ean 13)
    //    std25 (standard 2 of 5 - industrial 2 of 5)
    //    int25 (interleaved 2 of 5)
    //    msi
    //    datamatrix (ASCII + extended)
</script>