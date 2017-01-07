<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Transaksi Stok <?php echo $item->nama?></h1>
    <div class="table-responsive">
      <table class="table table-striped table-bordered table-hover">
          <thead>
              <tr>
                  <th width="1">#</th>
                  <th width="1">Tarikh</th>
                  <th width="1">Transaksi</th>
                  <th width="1">Jumlah</th>
                  <th width="1">Daripada/Kepada</th>
              </tr>
          </thead>
          <tbody>
            <?php
              $i = 1;
              foreach($trans->result() as $tran):?>
              <tr>
                  <td><?php echo $i++?></td>
                  <td><?php echo $tran->tarikh ?></td>
                  <td><?php echo $tran->transaksi ?></td>
                  <td><?php echo abs($tran->total) ?>&nbsp;Unit</td>
                  <td><?php echo (($tran->fromto)? $tran->fromto : 'none') ?></td>

              </tr>
            <?php endforeach ?>
          </tbody>
      </table>
    </div>
  </div>
</div>
