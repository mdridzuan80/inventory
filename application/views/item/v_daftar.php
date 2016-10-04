<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Daftar Item</h1>
    <div class="col-lg-6 col-lg-offset-3">
      <form role="form" method="post">

        <div class="form-group">
            <label>Nama</label>
            <input class="form-control" name="nama" type="text" />
        </div>
        <div class="form-group">
            <label>Catatan</label>
            <textarea class="form-control" rows="10" name="catatan"></textarea>
        </div>
        <button type="submit" class="btn btn-success" name="btn-daftar" value="btn-daftar">Daftar</button>
        <a href="<?php echo base_url() ?>item" type="button" class="btn btn-danger">Batal</a>
      </form>
    </div>
  </div>
</div>
