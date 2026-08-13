Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B9E369D5E
	for <sophgo@lists.linux.dev>; Thu, 13 Aug 2026 07:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607308; cv=none; b=JsBuwv0j9FPz/+m1PvCk7+Pbr31389CnxUu6qrG7+wavbgGYE15ebIXRiBRTjLrNkprgzsJzGH596ksIAGWOIoZv2Ry9pqmvN64+49O9P8Jmv7xGfFIA01kRofdArpBlP6ojbYS+PRDnvsvRFt+lyMVyEcPOSKmVP29WJcKzsIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607308; c=relaxed/simple;
	bh=d+k9bWJF7pvlGsLUQXb4Rg1E35L1IAdSPliURjFA/nA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X51y/x6G1RSX0smQRJiYsDGfRKlGjgK3J4B7/Fw2GpURm5LVIRBSTddaEZicE2qVrpstm73eehWSBAK4BQFAzkV01WDocgW5J7P7y0yRsR1M3vhonVXoHBlJkUPIv/FcCtEHiD8HlKcihN315yR7H44+MKR4ZFvs1RKdGfLOed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZg33Y9/; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZg33Y9/"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38759bcd877so566305a91.2
        for <sophgo@lists.linux.dev>; Thu, 13 Aug 2026 00:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786607307; x=1787212107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BUq274rbkY/de0NQshPMZnhY2Hc/sgHkU9E0uVLM2FA=;
        b=EZg33Y9/7eUdLDJIoc61S6gD06+7Sb9UPZj1bxZOA09GIbegiofT09SOxZgaJkbydO
         mRMWAvRbdpjuiBtjLPd5Du0Mv5axDKtDSTqF9M7MnrXfb6ow/JGbhprJ5qcTvvFvaitn
         AS3U4zNopyGvR2HXLRlQprul8AQ3eWT8KMADkRhXIdtXLCMPzOD4e01hSO3Mf0N1EGSb
         GB0NWoovZPT9EqAzzdMfuQeBzOxogeKq6sW3H2xrI14jVZspQkMMslHGucCbOfbayFLl
         2vZWvRdj6V3gz/r5xQNdJJdpho6j6QEa1m3gYeqpZVYfUo1ffUdTDLdgOmH9uQ5bEw2u
         hCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607307; x=1787212107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUq274rbkY/de0NQshPMZnhY2Hc/sgHkU9E0uVLM2FA=;
        b=kDcgfjZ7Uk+LB9VumNaG82pNy61Mdzk42zPfDq8LcXih539/CO8t4jwUgXA7PK3WBw
         CO+0juFVpYNI4OHVtjGClhult6SqGkUXfEF8trXDI/ufUK+jTIJG4lfykRLagBNAp/sR
         708Ta9iw0wuGgyL6Qj/bfSINgkir8NMlU8Hs77WUaL82teRRKX90wrXZC0GJHF8sh9ZJ
         VLpI/3EIxmwVAABl8WQQj/ryCmqcAz4cHRky2P1dLRBqevA37uPqn2TLaGDCEMQcoGx4
         dO+C/oE3M7zFtRe+AnnbUwGrf6YWppn/yZLi7gD+j9wSjzeVAUCvuWd1l3zc3/A1oZsH
         gLZw==
X-Forwarded-Encrypted: i=1; AHgh+RqqhSV9azAaLf/OtPwuUt7SMtvxROY+I2PN9LbVZlzxHTB/DW2oHAATyVHPjHGrLPzerj6fNSY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPwqFCEgRkXne+9jjCVjoCF24qhQqVO9WzkkeSEM6+AiyWChB1
	pUg5T9XcsmwaffuarRlZAgp4K8vr+HHTrjxHGa50u9KfBY1Z9pDlrIK2
X-Gm-Gg: AR+sD13Q8VX31FvPfzGOnph4hTj2J6LPr2UK78vJQiLQ+r+gHG+3U0T2qAxVKW3ZsQF
	NaZFu4drepaSBhigZjEjESwSDh4QxAmkrTKMjIw1YUaYbcO2PLwXDiPWFPz0knK+FLgMHcrF370
	Tj58iw3FcWtdo1VJYHfHsycpyMHVhL6+cluyBTJU1wN4fpd7pDKeuC2CyhknOcrXqcDY9mMAeAs
	6lsIte5xmoncimrqUVO41h94HBJGJFfWinrmhZ0vMErtj4yel0CW1lhGrGMicVsVQL4A+S3zmDy
	rVglGxEFPfy3oTNFPMnutKMR2p6IIMngFn79qdpT0ful3ksCICB36ehYoZOaKZ5ygu5bTdFVHHQ
	8M/ekwoGuoV0IlcGWfasdr4FbOTDjBNY8SMTMC/O70M4oprz4xgIjSl4OUII07F1P1JZBImacqC
	tkhjGwf2hT5zL1Ks0TugeJ3c9WFOgVHW/hLIhLW3CwB1+meJx+GUe5+QKflNZx6DvqXVhpzNLD6
	OAOx4SRrV/AYSVsjyHFl5brX2DJs/rO+Qb0T7fxrnHoQlQXTLY1eiuumkjeg6YtmA/e8U6VNbqP
	y4E1hvM7ZxvBmds=
X-Received: by 2002:a17:90b:2790:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-3931dfe502amr5239141a91.3.1786607306550;
        Thu, 13 Aug 2026 00:48:26 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931f41cf6csm1771442a91.9.2026.08.13.00.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:48:26 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	nuno.sa@analog.com,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	u.kleine-koenig@baylibre.com,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-iio@vger.kernel.org,
	sophgo@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] iio: adc: sophgo-saradc: Handle errors from optional IRQ lookup
Date: Thu, 13 Aug 2026 14:48:10 +0700
Message-ID: <20260813074810.27574-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

Propagate negative errors other than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/iio/adc/sophgo-cv1800b-adc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/sophgo-cv1800b-adc.c b/drivers/iio/adc/sophgo-cv1800b-adc.c
index bdc3e1326a9a..c6eed09acfcd 100644
--- a/drivers/iio/adc/sophgo-cv1800b-adc.c
+++ b/drivers/iio/adc/sophgo-cv1800b-adc.c
@@ -182,6 +182,8 @@ static int cv1800b_adc_probe(struct platform_device *pdev)
 		return PTR_ERR(saradc->regs);
 
 	saradc->irq = platform_get_irq_optional(pdev, 0);
+	if (saradc->irq < 0 && saradc->irq != -ENXIO)
+		return saradc->irq;
 	if (saradc->irq > 0) {
 		init_completion(&saradc->completion);
 		ret = devm_request_irq(dev, saradc->irq,
-- 
2.43.0

