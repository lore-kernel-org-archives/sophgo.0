Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147DF1E4AF
	for <sophgo@lists.linux.dev>; Sat, 20 Dec 2025 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766248438; cv=none; b=YwJ0SUoZ3NPWdCqqLLqFsGN53F9EaQkC0p4NY0GoGOwT70UUiyq8ORQ+4lXThmig9VM1p8q1ComsMh7l+811wIW8K/K8V7zcwc5+zb6Sg0ZErmILRTskEaOi+NzNb8kkxD8GXh82EWLVAUqvmvgcEAISo8qPwckKg+BHPlafArM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766248438; c=relaxed/simple;
	bh=X/PduQ/1FpFHypH0t4tblBrLl9mmsB4XYVAAs5j/FfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVcgRauCCOfLNG+hcA6N2eTl97OQ0TN045CEU6gVYbrOkJn/DiCdHeQhvKN2Do0Vv+2FkIePU1eTimWYCuqGSI6upS46FNCxJuVT3co6IdROslCvJaiRgwhT2D6w7mas79GKjn/9x43Vmaa0D9CEmmJJzRBJLh+SZkdjO+Cp7+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [223.166.92.103])
	by APP-05 (Coremail) with SMTP id zQCowACnPRHnz0ZpnwlTAQ--.53309S2;
	Sun, 21 Dec 2025 00:33:46 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH] drm/radeon: bypass no_64bit_msi with new msi64 parameter
Date: Sun, 21 Dec 2025 00:33:38 +0800
Message-ID: <20251220163338.3852399-1-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACnPRHnz0ZpnwlTAQ--.53309S2
X-Coremail-Antispam: 1UD129KBjvJXoW7try8AF4fCrW5JF15Ar4kXrb_yoW8uw4UpF
	45WF9Iqr9xtasIg3y7XFW7XF15Aa18Way8Wr4DG3sxuw45AryUGFy3Z3W3JrykXrn7Xry2
	qrn7G3yrur4FyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAUCDGlGuzwaKwAAse

Sophgo SG2042's MSI driver lacks 32-bit MSI support.
Added a msi64 parameter to skip the limitation and force 64-bit MSI.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/gpu/drm/radeon/radeon.h         | 1 +
 drivers/gpu/drm/radeon/radeon_drv.c     | 4 ++++
 drivers/gpu/drm/radeon/radeon_irq_kms.c | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 527b9d19d730..7207e3156c28 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -122,6 +122,7 @@ extern int radeon_uvd;
 extern int radeon_vce;
 extern int radeon_si_support;
 extern int radeon_cik_support;
+extern int radeon_msi64;
 
 /*
  * Copy from radeon_drv.h so we don't have to include both and have conflicting
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 87fd6255c114..53af28494c03 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -249,6 +249,10 @@ int radeon_cik_support = -1;
 MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled, 0 = disabled, -1 = default)");
 module_param_named(cik_support, radeon_cik_support, int, 0444);
 
+int radeon_msi64;
+MODULE_PARM_DESC(msi64, "MSI64 support (1 = enabled, 0 = disabled)");
+module_param_named(msi64, radeon_msi64, int, 0444);
+
 static const struct pci_device_id pciidlist[] = {
 	radeon_PCI_IDS
 };
diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
index 9961251b44ba..62eb5a6968ff 100644
--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
@@ -250,7 +250,7 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
 	 * of address for "64-bit" MSIs which breaks on some platforms, notably
 	 * IBM POWER servers, so we limit them
 	 */
-	if (rdev->family < CHIP_BONAIRE) {
+	if (rdev->family < CHIP_BONAIRE && !radeon_msi64) {
 		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
 		rdev->pdev->no_64bit_msi = 1;
 	}
-- 
2.47.3

