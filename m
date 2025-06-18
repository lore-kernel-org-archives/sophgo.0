Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618661DFE22
	for <sophgo@lists.linux.dev>; Wed, 18 Jun 2025 03:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216379; cv=none; b=lqmpz3slO05uvI5W4fQmrfZqnILYiB40623oxZ4/aGBS5mSsVTVCJhtcyiGoL6O5jr4czNAHWOsQMxSAss4R342eKSllxLJZdjmYbXrtB2ABREvCwta/T4tC3E8ZLzW9dawwVPuzdAQ1TKNpo8WiORx7NQpsLHZYBxlMBoJ/3nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216379; c=relaxed/simple;
	bh=CaIBrWdHA8A6Hl+8od7bG7PtDXCOvZVEVSYJx4ibA8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pCLTmdKHr73vjVtc2PjsnhqxDVABzTFJsUgNKC2dFOHc/op/VgK7efpeHJb4rmxZH5Dqnjv0khAbkt59sKkrGCEGZr8tF7XcgNsvobqbWe955yKD4JjW2h0Vs7SwWjTfH7LK4JkgLXZR+7LN3KRLUxgyQafRVdLYeXTfW34yc+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kO2hyXVZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kO2hyXVZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235ef62066eso97910075ad.3
        for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 20:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750216377; x=1750821177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVmw5bZbkl4jrrqCt8IvJKSgjCMD7aRK/gZMumHgDnk=;
        b=kO2hyXVZ2pxqzj9B+HPz3TNv0wD2XQeXQud5QHT8l2pHQzjiOd1u/eg1jikSQeVu4f
         G4oiggOHQ11qn+TE9fZzew91BRgF5Yam7IfPIzNpaSnmsRZBiK6E6dJKOd5Ry9lyNR6V
         Ec8utkXXa/wEr9jWvepCqSs0Lr5XCFjuagB2CpEZZdDhkGw9vieh/ZHBwMuDYqGE8qcp
         zJF/f0JuRiq0Rp+lWi017LhBHUdnMYryRv1E3tynnYNxyB27svggJ6pUpT8rm4ofpaTq
         AJVN5D/SmW/xR70Kisd6OmICqu6LvV10WLP+ScviPfj295lDM/2Vw0o0ETS51kOyEelz
         4jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750216377; x=1750821177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVmw5bZbkl4jrrqCt8IvJKSgjCMD7aRK/gZMumHgDnk=;
        b=g4hVYLiJW50MV5KcqEweIYp8W+uxOHp8SUoaV8cS3w8uWqFG2Wddki636x0rN64wWp
         DFnEFcdK0Hl4Nx2lyPqTotYUAbhRCqFY80w+LuYbqbRX1ZHZ8IXDOvrROu8o1pcK4ef5
         7D7Etsd3YaPLaDZdjuJ10D2Fxwfandgx9mmZoIz4a3C4l7hhFsVqhNuAyoRb4YocdH9R
         9rN+LUQb+nGTr42GInzWnfR929EipG1bv3gZJ560Uf/Utsrb+l06AdzOuX4Nv4gaDrN9
         CTJvEMT7CLPG3Uw90ne4bDA2DLP8OmDjum7inl7hRJBTWM74WNUxZStCFktb2giONkBx
         tx1A==
X-Forwarded-Encrypted: i=1; AJvYcCV88nGr0ePyJTynSpgLCTgzUJsDMTF70fvGFKLvENpJ1VrfgDUxnuDpfC9SD25sBbKXEdUpBjE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4s8FRPyefEgqh8VT8nKPFZvT1BW059cGkMCCuNUT4MRAuE6T6
	TGcOiCdTZIGyzZW01/9LlxeuV/Ta6Q3fcD7gfqFpeVS22syP1u96F8Di
X-Gm-Gg: ASbGncs6JU78Y63d38Zo9T1QEGfWDqNaZXMXso54OQNZnkkM52LiTprs3qX2GvIqHIT
	TfIGjuwNM7CVTrp3KdMBCmapThWEONLyMwDpUzRLk1ycMNcQONvf1ijs3w0zW2GlfnOEkQuf/dj
	NiCJchvCSCGTiok2yaJ4ghRqepJQmDu9m/cmEt2M2H+9E6Ko0k34yI++DKfxMnvlR+sndt4SN86
	sytPCXuzM5OrRDdTg7wtvOx8HbtF6/1vYWJZVg1MakujokpZA+hfaKSGnpUvOp9He6Y4wpvO/C6
	ElegSK3mkyOcyIuOj3He95D2+V1oX5YIVMxNYQ8KCq21UbheEakbH9Knzi1oXPZtBUAdEPIy
X-Google-Smtp-Source: AGHT+IH8hgD1LGsHJfDQnAXl9HvOeBTvxQ0AmdkVrJ64/WhDiqReq6a0y9o7OxH1H5lmzbPMTmNXgw==
X-Received: by 2002:a17:902:ce81:b0:234:f1ac:c036 with SMTP id d9443c01a7336-2366b40b7c2mr211182775ad.50.1750216377556;
        Tue, 17 Jun 2025 20:12:57 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe1642ecfsm9772763a12.19.2025.06.17.20.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 20:12:57 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] usb: dwc2: follow compatible string change for Sophgo CV18XX/SG200X series SoC
Date: Wed, 18 Jun 2025 11:11:30 +0800
Message-ID: <20250618031132.373216-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618031132.373216-1-inochiama@gmail.com>
References: <20250618031132.373216-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the wildcard name is dropped and favor new compatible string
which match a real SoC, and it is not used for any board at now.

Rename it to sophgo,cv1800b-usb to match the binding change.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 4d73fae80b12..ea6bd537e337 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -334,7 +334,7 @@ const struct of_device_id dwc2_of_match_table[] = {
 	  .data = dwc2_set_amlogic_a1_params },
 	{ .compatible = "amcc,dwc-otg", .data = dwc2_set_amcc_params },
 	{ .compatible = "apm,apm82181-dwc-otg", .data = dwc2_set_amcc_params },
-	{ .compatible = "sophgo,cv1800-usb",
+	{ .compatible = "sophgo,cv1800b-usb",
 	  .data = dwc2_set_cv1800_params },
 	{ .compatible = "st,stm32f4x9-fsotg",
 	  .data = dwc2_set_stm32f4x9_fsotg_params },
-- 
2.49.0

