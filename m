Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FD22620E1
	for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 23:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740613387; cv=none; b=cz6R92ENjQ8ssnM+d9rnDlC1Zg63IYmKr/pyox92pElcjWJcrlCI4TGl6Rh9OKiNK1N6Oywxr5wUkpDXPEoJq8QMEUZJiBPZnHEkrMi51BtUOxW4ejwHWGWicRIGV8lf19wa2sIE/gPp7rsv4AGJKGJafXPQt2JcKd3MOahx350=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740613387; c=relaxed/simple;
	bh=cga9488zLVFf7sCO0MjjdfdtRfVLyx321Cy+QiZ4Dvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnSajdp2/nd5fZqAWdHIx2AekDuM2FIID2fwNHCib0j1W50vHvTXrXtIS8Va3z7/dYX9TJCKo4w831+6JQo6LGA8NkzWTA7IQ3iFjBvqJLk5C5cmUQUhKgolLloTQa8mADkEmU9hSQsit1Sw5ixr2Dr3pZM8FqPUMujC1ykN10o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIVJN/Vo; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIVJN/Vo"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e660740061so4140566d6.3
        for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 15:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740613384; x=1741218184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqQoHTg7agUCd14WEWX/oWRFNn9TygqwW0Esl6cK8GI=;
        b=SIVJN/VowDR94KjfVPGJ3gMDntFNGXPYN1t5r1Em6KiX30rUe4jyw0ysXdQvCMpqAu
         mGMttmFDA8i4QqaLH8+mexH64FhmNXjEC/zHCYhM2BcxiY5RPb0xIegei2RBWV3QhVnz
         xpghU7QoDhSDM0VW2WiW0y6pR9MmnLavLtra1jcHEv9z+iaueAiAbQji8D51zDKU8Lj8
         sMQCTW82Zca6VTl44BhWRQRVNtyIyCGPnIGE3fyYBqFueU4P6GLDSZqiCFFHi5YLaQlH
         CglJb0inVRgMQ0b++9ZnPBgpUl2oMJKWeHvASj6ob9RCsU6co/zQjUPBy7Eck4lCMui9
         uj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740613384; x=1741218184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqQoHTg7agUCd14WEWX/oWRFNn9TygqwW0Esl6cK8GI=;
        b=cmSaVwvJjsKzW//mN0OBQ1FISvr2aMzXej3zaGhxAw975h+n0RLoX4B/sPh7srSfKW
         ibZzjfZ55pSnfOkjA5Uo2DXODJWBuf3F1wJH2wpJgILRLp9nObPSUcrmb119ccjbr1oD
         lR0Lpmz64hBExwT89epiw5PlEEqRfAstnaQgwqKJXIDJWb8H5aiuVEl08odxQlIfpYXJ
         vrTN8BUcU1RZ5jJZoUwZj/exUMaZLiy7enTd4LOOPztEzj8htwb1zv/E4cnnp5BLb/nP
         z16d8veDmhqoTtXOFdkf10yGG/cr85KklbjJg+pIOZ+U1P8R+63G1eLu5Pmgn1X7UmGu
         GvHA==
X-Forwarded-Encrypted: i=1; AJvYcCUcWhQjr/hXrgWkg1IiHm03LHZuNzakQ9YupVAAwCEWHbSliQjIHlU30I5xIR1jXYj1jGm2Yys=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJH9ifi9CiHJ0tD/bTcHOV16XBnhK3/9x1bghcM0Og2gssJHYl
	b2fFP5pVHonVEAMh91nq5mHi7ld+Dv1ZbK6GKnI25NMxCrsjlRvR
X-Gm-Gg: ASbGncva2S4VP7iLkVrcyJdVGRLmHAeQuX+aEueYoEaqBNU4nnLUckgguIRYsnUVdO2
	Q0Ng9ctiOhsLdwWR1l+5L9yQQ5JaenD+sH82urGO+kT31NRD+gQzeYWOJNL1UXgZ+GPyyFb1MQM
	/007uJszmAoZUIDdmY+VE8cRtnhWNeDIi39wKhEcjjRYs4ObDdjDfZjlzzT8Wpaplzy0mqQ533F
	SB7aFuh0GdJdakyG7I0VeohOwAybfwlNuy4HGI5z1/1jyuCG84Wta3v56yEV/XWqa6svPFiPhSd
	ag==
X-Google-Smtp-Source: AGHT+IGamOlB8L5DPR7KmoFMGsjzwDrX/7GZPr5d7+DS9KT5p5K9ctOUhXRuQL0MoiV6ugPJfD161A==
X-Received: by 2002:ad4:5ccf:0:b0:6d8:8109:a547 with SMTP id 6a1803df08f44-6e88689b91fmr79086796d6.22.1740613384532;
        Wed, 26 Feb 2025 15:43:04 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8976d9f19sm2383616d6.98.2025.02.26.15.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:43:03 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/5] reset: simple: Add active-low property support.
Date: Thu, 27 Feb 2025 07:42:30 +0800
Message-ID: <20250226234234.125305-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226234234.125305-1-inochiama@gmail.com>
References: <20250226234234.125305-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce "active-low" property support for the reset-simple driver.
This property allow users to mark the reset device is active low
without adding a new device id in the driver.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/reset/reset-simple.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..4b08f8d70942 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -16,6 +16,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/reset/reset-simple.h>
@@ -190,6 +191,11 @@ static int reset_simple_probe(struct platform_device *pdev)
 		data->status_active_low = devdata->status_active_low;
 	}
 
+	if (device_property_present(dev, "active-low")) {
+		data->active_low = true;
+		data->status_active_low = true;
+	}
+
 	data->membase += reg_offset;
 
 	return devm_reset_controller_register(dev, &data->rcdev);
-- 
2.48.1

