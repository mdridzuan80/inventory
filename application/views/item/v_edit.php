<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Edit Item</h1>
    <div class="col-lg-6 col-lg-offset-3">
      <form role="form" method="post">

        <div class="form-group">
            <label>Nama</label>
            <input class="form-control" name="nama" type="text" value="<?php echo $item->nama ?>" />
        </div>
        <div class="form-group">
            <label>Catatan</label>
            <textarea class="form-control" rows="10" name="catatan"><?php echo $item->keterangan ?></textarea>
        </div>
        <button type="submit" class="btn btn-success" name="btn-daftar" value="btn-daftar">Simpan</button>
        <a href="<?php echo base_url() ?>item" type="button" class="btn btn-danger">Batal</a>
      </form>
    </div>
  </div>
</div>
