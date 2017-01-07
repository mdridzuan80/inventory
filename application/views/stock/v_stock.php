<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Stok
      <span class="pull-right">
        <a href="<?php echo base_url()?>stock/daftar" type="button" class="btn btn-primary" name="button">Daftar Stok</a>
      </span>
    </h1>
    <div class="table-responsive">
      <table class="table table-striped table-bordered table-hover">
          <thead>
              <tr>
                  <th width="1">#</th>
                  <th>Item</th>
                  <th width="1">Stok</th>
                  <th width="1">&nbsp;</th>
              </tr>
          </thead>
          <tbody>
            <?php
              $i=1;
              foreach($stocks->result() as $stock):?>
              <tr>
                  <td><?php echo $i++ ?></td>
                  <td><?php echo $stock->nama ?></td>
                  <td><?php echo $stock->total ?>&nbsp;Unit</td>
                  <td><a href="<?php echo base_url()?>stock/transaksi/<?php echo $stock->id?>" type="button" class="btn btn-primary btn-xs" name="button" title="Rekod transaksi"><i class="fa fa-exchange"></i> </a></td>
              </tr>
            <?php endforeach ?>
          </tbody>
      </table>
    </div>
  </div>
</div>
