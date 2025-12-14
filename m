Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EB1265CA4
	for <sophgo@lists.linux.dev>; Sun, 14 Dec 2025 22:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765752436; cv=none; b=WvXG96XQ3wfOMCYjNVBbfvdCX/pW9b6Og7Jlnmfa7sgZVx2rbBHypMtuTKokKaRG4buTkyjaYIwPH/M9v8psCVN9ECmdKF/OFHRl2XtUHbbabjfSMxAlr0xWqzgfeLPbhWhnTU2BayXS6Sm+0q6W+5lTnSR1VOruFjYvERcQUPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765752436; c=relaxed/simple;
	bh=9q5/APX87RGgYmhMNh/WDYwQpX7HX4MP+fy+fzWDQzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q41CBceXsW1VJauKs/w8i7l7CrvM/M9/pN4ZO0cNVvav+gV0z3Y3fiXnJMugCeguOnJSZGkfNBNru4DGp/9lSu6BOtgqUHJIkeHOtWfLpxsQK68nR9ddi0MH8Xm0UmjL6dpvMY4+SueMyLi/TRld3FQT8xvYZTUkjFd9Ike3/bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvFXkdNw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvFXkdNw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0ac29fca1so7473555ad.2
        for <sophgo@lists.linux.dev>; Sun, 14 Dec 2025 14:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765752434; x=1766357234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDRFsyvQwwFF2ebD1NnNsyQGvhsS9i0D0wecAIBs+ow=;
        b=JvFXkdNwfYGNU7tvF9znvPUeMMNw4LiL2gJFyYCE/XKlVh5KV+CWuNMeCGsJ/Wc1Oi
         /Txq4Seqkg4ShnPYKjPo06OexE/ep3pkO8jbOQrr2S4II4mbpgGi/b/34spGuMlSkaGq
         kU6YqY0FexUfcd8aVcLP4tBXwYvpfONibDgIQ3TRe2nzrzWXLzqu1/eFdXHi4shXUbnF
         rv1W5wjhSBPJXuXXp40bvRAZ3qrSQU7VzeDnfHeqKHyDzg5CE1PiPIGvJqI9327fallQ
         eZUZ3OiMOkYstkIvNUzPXfom3pIlusoVjoXKPmdf500lne9ze7IVb6tLFn/GAgxK8/qC
         ZWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765752434; x=1766357234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lDRFsyvQwwFF2ebD1NnNsyQGvhsS9i0D0wecAIBs+ow=;
        b=MI7O49iwffx4U6wg0VPDY88UM7QBXlsakXD1D9FvIYiXbFqwTaY6B5r4Pejg1qWAZt
         m8xgULPe/hQS1fDwvBBu5zxqmwKfuD7MSrnd8Y9mzEDNgk/QF3UWucgDI26JyBZ+EeUD
         i6l+v6XBg7wSSp6Axp829PbR2RV/+V33zMe/7L8hX15KiTCMqU4kpDI/8gUtdEpfJ5oC
         AxnpomLk4PviLsr+ojUyGDWkPTYfhhZI9Fl57licVvUZSZGDmyPMKGXRbGiEUrfVEe0x
         6zhOyFsm6va9O6NXkHyjkEQdN55YJghdMcEeUkl8q5vMJxvNzNQLTbHwYPMKWW9E7QGV
         j8RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAHjbolMjrMOgxrKJfYh99iWXk+WZrVwBhvjXmW5ASpR2HigzcMgUKeNd2RrIXMA1gebvqXiE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiUGU7VftIC47f0t+9vkaUvB1iKOO9u4yTcTO/E0heHemdpP+R
	rNrJ8fCQQvBTZeNdTF5VXlUuKZCfFz9d/co3zGcuqkaLug++7yaQnhtn
X-Gm-Gg: AY/fxX660zv1p6caDfpwy7P2foRe9OvMs3piUG36xd7Z8bT9/WLFWh1w6KvXh/5XRyo
	0Mq4P9Y8HeAnWaLvmAUZ2+e5H6EyBo1stJ+Wf8finZYRqISQ1eeLCRNMShKRYGzqQcqRu3TK/Lp
	VMO6WZPlpx+/MI/OVDOb69/iOIbY3Ao3606QWd7ig3OiPvbl5sSLrMsOZyirKl2WkJzEo6oiZRL
	qdOe1BcnQPkfdyrxPH42BJ85ntqp2wehUDqW6Ur606TigbVv05xBV0Cj+uLQTOkDiE4yL00zVa9
	1KXPZSMHPBIQN2PLb8mx5jN55aiiJjnRmkG3b8OGrVVeJy5F01riUA+N1vUcuCk95N+SkM3Pj5D
	NpTLLeKCKemAZQ+JnqKzIWZPeKnysDYoO4SUaysr7q8r20W9Ow8uu8hGCsij1sWb8eWgTmeqQto
	4Z1W6zr/9PjA==
X-Google-Smtp-Source: AGHT+IHY+I6N505J8tBBxCiWTM4hXbMHovgZ3qawJ/YmUXRO/axk7y7nKaNrWFiQXdKScyMIfR120Q==
X-Received: by 2002:a05:7022:6184:b0:11b:8f3a:3e07 with SMTP id a92af1059eb24-11f34bee60emr7877296c88.11.1765752434409;
        Sun, 14 Dec 2025 14:47:14 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffac2sm39963363c88.11.2025.12.14.14.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 14:47:14 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 3/3] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Mon, 15 Dec 2025 06:46:00 +0800
Message-ID: <20251214224601.598358-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214224601.598358-1-inochiama@gmail.com>
References: <20251214224601.598358-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
which supports setting DMA channel number in DMA phandle args.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 1b2b1969a648..e1b515b46466 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
 		};
 
 		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "sophgo,cv1800b-axi-dma";
 			reg = <0x04330000 0x1000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
-- 
2.52.0

