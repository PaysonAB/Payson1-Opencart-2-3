<div class="buttons">
   <?php if(isset($text_invoice_terms)){
   echo  $text_invoice_terms;} ?>
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
   
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({ 
            type: 'POST',
            url: 'index.php?route=extension/payment/paysondirect/confirm' + '<?php echo isset($isInvoice) ? "&method=invoice" : ""?>',
            dataType: 'json',            
            beforeSend: function() {
                
                $('#button-confirm').attr('disabled', true);
                $('#paymentButton').before('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
            },
            complete: function() {
                //alert('nadad');
                $('#button-confirm').attr('disabled', false);
                //$('.attention').remove();
            },
            success: function(json) {
                    
                if (json['error']) {
                                   
                       alert(json['error']);
                       $('#confirm .checkout-content').slideUp('slow');
                       $('#payment-method .checkout-content').slideDown('slow');
                       
                    
                }

                if (json['paymentURL']) {
                    location.href = json['paymentURL'];
                }
            }
        });
    });
//--></script> 