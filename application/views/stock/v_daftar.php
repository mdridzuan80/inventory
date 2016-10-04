<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Daftar Stok</h1>
    <div class="col-lg-6 col-lg-offset-3">
      <form role="form" method="post">
        <div class="form-group">
            <label>Item</label>
            <select class="form-control" name="item_id">
              <?php
                foreach($items->result() as $row) {
                  echo '<option value="' . $row->id . '">' . $row->nama . '</option>';
                }
              ?>
            </select>
        </div>
        <div class="form-group">
            <label>No. Batch</label>
            <input class="form-control" name="batch" type="text" />
        </div>
        <div class="form-group">
            <label>Transaksi</label>
            <select class="form-control" name="transaksi_id">
              <?php
                foreach($trans->result() as $row) {
                  echo '<option value="' . $row->id . '">' . $row->nama . '</option>';
                }
              ?>
            </select>
        </div>
        <div class="form-group">
            <label>Cawangan</label>
            <select class="form-control" name="dept_id">
              <?php
                foreach($depts->result() as $row) {
                  echo '<option value="' . $row->id . '">' . $row->nama . '</option>';
                }
              ?>
            </select>
        </div>
        <div class="form-group">
            <label>Jumlah</label>
            <input class="form-control" name="total" type="text" value="0" />
        </div>
        <div class="form-group">
            <label>Catatan</label>
            <textarea class="form-control" rows="3" name="catatan"></textarea>
        </div>
        <button type="submit" class="btn btn-success" name="btn-daftar" value="btn-daftar">Daftar</button>
        <a href="<?php echo base_url() ?>stock" type="button" class="btn btn-danger">Batal</a>
      </form>
    </div>
  </div>
</div>
