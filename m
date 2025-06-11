Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6577D23A9AE
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 07:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628481; cv=none; b=PKZOj9LOX6WkfpKUxoT4mP/wCp7PiH9IyHhQy9Wo30v+m5ARHgyW5RHXG9ofkcERsf7XRjw1vtL7ZjtxaQqI77hw/XkrH7vq9TS6LFXWCr2ZXH2wOMe7DyN3YnzfUxyHpRAIrkcJFZVlBRHKljzxST2CGOz6lptLMltjQFeEQGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628481; c=relaxed/simple;
	bh=leYEMODDBviLVcx7yoQ0Zt5ZI1j1sck0Bv2d4cc1ysQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9793L1FCn075R2easaO/OK2OlNTarZd6sCGQwl2yX4jDI0OYugLbN4jbnDeWBP0p/pEabyn3+LVlW+Z/iDB7iktsoKWe7x6mMVX4zk3WVv8d5PF+xmnhfCETAPyWQTsgbSQgOQOct/h19nuwC3MD/McqhXm8nmy8GuM5MrPQ6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/ljwjAU; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/ljwjAU"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d38cfa9773so384255785a.2
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749628478; x=1750233278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TucqLG/tk3Y/USNHaS48EdntTVxxdA1FanRm1k8rL/8=;
        b=l/ljwjAUDQrj0NIvmYBb0FIMlmDoBqdsh2sQ3XW45K/jBDidwomkCm4uXhE2lmYXHA
         GMiRY3EU07EOx69a7+1eM9OoYKlSLD4AgOuoZ2UwoLxoHt+eo3kcpoiKoW2P3zlyDHWU
         MjOto4baHaY9F8lZCMU52rPFdyTB6xFRwV+SUtds3DJ/9dnLDB3qzg3+GCYt4aW8v7ae
         BUWDTc2w106u2BLY92T2M8u4U9j2RsDpB1BjS91Hjw6Jf75O4NopuEqcZk28eFhaic9r
         sntZ83xvFbuZJIKsb3AiKnjTb1iZw5a0dG4nzVAWQlzAdV/F1knVX61Oy+APIWg87aIa
         6KKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628478; x=1750233278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TucqLG/tk3Y/USNHaS48EdntTVxxdA1FanRm1k8rL/8=;
        b=hNCcTin+f+V/A85oWDlKC3QJFXcaTgug2yNZJfZA8w6d0rNLanY4TrGtqPHUg34i/4
         cx5/6dnz/SUkcDjrY8WH9tpNPijPITJx7m1ljLzipsTFEJnJ7dyiCP3MTstDhTXNNLif
         tVmiioa7Si28CaIWERvOgfNRhvHB3gqI9OiJGgj1wmExxxFMZPI2KS8dsGIRhZq3n7RA
         T3hTnaB6wTdUknYVT8i/FQ2Q3ZByn51DotPIzcL9Im8cQTa4he+EjgMqVJY0VnRq3NRC
         qVdrCmgFkVbA2/yiJTy89WKIOPnxb9TvFvmGDW0fiPDQW3uMozxX7xF9ma9calhS2bAb
         nqIA==
X-Forwarded-Encrypted: i=1; AJvYcCX6lGN7enEqF5+tjWyiNWKPFvSxiWUiW2O+X82A8JiIBlbZnDpfufKbaMaz15HJ7pgrQA8Lkek=@lists.linux.dev
X-Gm-Message-State: AOJu0YygLULWNlxNC31euwh/AIU+dGjgV8at3VDh9l8gO7I7IGojTDZr
	M8oFpdfKO/hHSV5sCTIGrUvJpLAWdL3+fbAsSDq0x/MAyzLs0Jvp8hnf
X-Gm-Gg: ASbGncs8ql+G26KdiFrcIj2LJ9PVbS1SuFFWzkwLyq8LEq6lo25PiAZK1Qy8P0FR7lt
	jsB5os3m1AStYZShgrT0Bl28A2cSA5nT+dcoElt/zQXG/d+52suvvXxpHYub7dTzIC0k+Ok0FVx
	SRrDqwDtG3ACrWhAFPCR/xNbVwkpBan6TuoMTO9nAl4XMbdQ1WV85+xzhktOr7KAW7TNSTpACGS
	sZtq2e7TCY5nI9UzIf5Ggq+8yp5YXJ0noEGp4EevTU6HGs2rfv5EtJRN63L8yDwtszANYOy9Vgn
	bc7o4pf+jIlpHxaNPi9+7dP8JWWpi67Eo8fMZau50wHstbdl
X-Google-Smtp-Source: AGHT+IEySdwciKZhGZrTCtsR/Gxqu5FAFCLHguwmpefzLwsb16bnu8UFs0/XpS23i1fk+Kd0aatnNg==
X-Received: by 2002:a05:620a:29ca:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d3a88057a4mr312939885a.12.1749628478269;
        Wed, 11 Jun 2025 00:54:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ab8a3csm79057766d6.10.2025.06.11.00.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:54:37 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dmaengine@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 2/4] reset: simple: add support for Sophgo CV1800B
Date: Wed, 11 Jun 2025 15:53:16 +0800
Message-ID: <20250611075321.1160973-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611075321.1160973-1-inochiama@gmail.com>
References: <20250611075321.1160973-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reuse reset-simple driver for the Sophgo CV1800B reset generator.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 drivers/reset/reset-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 276067839830..79e94ecfe4f5 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "sophgo,cv1800b-reset",
+		.data = &reset_simple_active_low },
 	{ .compatible = "sophgo,sg2042-reset",
 		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
-- 
2.49.0

