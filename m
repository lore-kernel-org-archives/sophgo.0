Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F892868AC
	for <sophgo@lists.linux.dev>; Mon, 25 Aug 2025 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756104916; cv=none; b=Ay5G33CyLEuIjB4VE0dXac5FscpE/2f0z6rao7ooWZqimu/RAdYKaSaUDd8QUoIW9X/ciSUC5edGiJ4QB7+WkLZsA9Mf+SEGlusVawFXNw6wXuSURQlR/Ysy783etGSJlkL6OtMyhz/6qVlQfHFxRUmgLSSz/hVoB21n3QsfpGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756104916; c=relaxed/simple;
	bh=XfvoWpG7yn1MnMYlFZwdOxlDXsB/OekSjnZ2x/KtlPo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hTq7EkueCUnen5P65ArbCcL888OHFAVTzT6ffmlFxv4eQjMz8lCvvELq3QkBcopPGl+2LudjAUfQqPTHr8kP6eCearxqIm3VNfSJixgv55JmkjGCt9x68hVrWvgbNRT6UxdiU5X4M2dN588tOJZhSwzl/0sG2B7NMXpWn2sERXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmsYWRF3; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmsYWRF3"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-61ddbc4264cso189912eaf.0
        for <sophgo@lists.linux.dev>; Sun, 24 Aug 2025 23:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104914; x=1756709714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+yGjr2heO21gMCA2kFQQZ2y9Wya4HGwCF6Hx9Cjwbc=;
        b=SmsYWRF33w/pp1lI0Ey764vuyzAc1Sk6X2CqaUzPVtSX7eBlFnGew1afzy5aSPitEh
         pxa2A/F3fEiy7hAtXeIRkvEdDduLv+zMNxBKnRyEPEo1R3JpjNQV1rto1KD5LX1zuNSk
         tDC6QErsIE6+VScFb7L9Dg/46u2pBZHOoLDZtoMxQ6JKZ1QdqQKYbAdBXyK2rJacorTf
         iFJE+urmZk6SV0Yv4XZPmjnLwY7PDWr657NWSuzB4T0ftWTfcqYPI2O48v6S3HTZU9lo
         clYKSyyqZagbJugn/LD2kTjsWfvWeQmVdrs/Br3JAH4UqZjVQ2+YdBsja46/KnSQi6mG
         UJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104914; x=1756709714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+yGjr2heO21gMCA2kFQQZ2y9Wya4HGwCF6Hx9Cjwbc=;
        b=S+cRup5cWdrSM3+OYHbGup0niibJt7/P4K6fKhQl5IXNlJlxgWx//Eo1jZ4XbE6XUX
         0n3rnE/FuxKtGIkirEyxsEVizKCHlfV7ba0EEcDgk0nGNRi/0X7jmJVxXlH4m2e8gedA
         76cTpFw7t8NDkzFDSqTkqR71Le2wiSm256HoSiXigi6wESmmKJjylwiTvcNh5qVkQ+v9
         wgBeLN5PJ7X+7UoasiGAi/SqP0oW9D69LFLOOU66ySlWPl1/BPrDO0biHOzXFTGMEd3J
         RGtiPWKFNyAwAAypXPzlkUsnY+W+JNB+AA7eYtpREjkcmKioQDChYu8gop+kuzdpk3vs
         5FZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR69rIgxRZgI/fkP1k1vDlRBbYwxbY/jJkcvjo6xfxFhJ3MbJAc62OEmRKHNu8zfFeKlRd4Io=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAHcfkJyCJZHsqy4iZlJHYwvUbcR5KC5sXTch1uviRTtRo0rqr
	Dl2tWPh4fYnawUTv0yAfyW3XjREercptknk/dORRhYV6c7MRyGGatdew
X-Gm-Gg: ASbGnctT8Hw1tWB47GRaViCuyJARBPPDz7b8mZD2Yj5kK8/YNiNFO31MKwCi59IpOHk
	YuKEB2l2B49IP5GGsgPGJlIWZkzd+oJy0UxinIj0eexg2z8LfMGlpd9FFjZ2fi2YFLHfI6m/yQ+
	00MdyINbbyY/0kYfDay+qiJTMNmufbQQowxvT7HedgC3MnkGZ0VlKtDcoP7ahLJFBAvR9kgGFYY
	9C6qRqzOxlR38bQm9+ZgdQX/9l24zdO/9eHFkpz1c9JLGU7eKQZJPBPyZ/x09r82mghTkMI8Fib
	yX62FEpyCumQKhDTXHDJ/K4tASWOdm+qdKx6dWvWGQv+qsZv/7Za5OIrEmLRKpVPGFRrZyj9ssW
	4MCvVE+8rS0wcpvR3DXNbTdARPu9WixUT
X-Google-Smtp-Source: AGHT+IHekG6OTGU3l6qQrokM25geuzr8Jsvhtci+xI2DkA29jrojoxfyJ2/APQwGqhsrHpj23jMdtQ==
X-Received: by 2002:a05:6870:249c:b0:30b:bb5b:8d8b with SMTP id 586e51a60fabf-314dcabd8e4mr5680879fac.4.1756104914059;
        Sun, 24 Aug 2025 23:55:14 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-314f7d98e29sm1618117fac.31.2025.08.24.23.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:55:12 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 1/4] irqchip/sg2042-msi: Improve the logic of obtaining msi-ranges parameters
Date: Mon, 25 Aug 2025 14:55:03 +0800
Message-Id: <adb383f0f4a3cb588448a5a708fb7a907d5e9403.1756103516.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756103516.git.unicorn_wang@outlook.com>
References: <cover.1756103516.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Get the arguments of msi-ranges by specifying nargs directly instead of
using nargs_prop. This only takes one step, unlike the previous two
steps to get the values of all the arguments.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/irqchip/irq-sg2042-msi.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 3b13dbbfdb51..5249afd93b4a 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -276,17 +276,9 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 	data->doorbell_addr = res->start;
 
 	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges",
-						 "#interrupt-cells", 0, 0, &args);
+						 NULL, 3, 0, &args);
 	if (ret) {
-		dev_err(dev, "Unable to parse MSI vec base\n");
-		return ret;
-	}
-	fwnode_handle_put(args.fwnode);
-
-	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "msi-ranges", NULL,
-						 args.nargs + 1, 0, &args);
-	if (ret) {
-		dev_err(dev, "Unable to parse MSI vec number\n");
+		dev_err(dev, "Unable to parse MSI Ranges\n");
 		return ret;
 	}
 
@@ -298,7 +290,7 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 	}
 
 	data->irq_first = (u32)args.args[0];
-	data->num_irqs = (u32)args.args[args.nargs - 1];
+	data->num_irqs = (u32)args.args[2];
 
 	mutex_init(&data->msi_map_lock);
 
-- 
2.34.1

