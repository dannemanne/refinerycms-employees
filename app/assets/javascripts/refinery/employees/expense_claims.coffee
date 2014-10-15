do ($ = jQuery, _ = @._) ->
  $ ->

    # Changing template interpolate to Mustache style
    _.templateSettings =  interpolate :/\{\{(.+?)\}\}/g

    # Template for a Receipt row
    receiptTmpl = $('.js_receipt_template').html()

    # Function called from template to load the receipts into the table
    window.loadReceipts = (receipts) ->
      if receipts.length > 0
        $('.js_no_receipt_node').css('display', 'none')

        for receipt in receipts
          $( _.template( "<tr>#{receiptTmpl}</tr>", receipt ) ).css('display', '').appendTo('.js_receipts_table > tbody')
