Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190C6267AE3
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425415; cv=none; b=RlmVPdRiU82aw8BiEctntOyipa6xSxUCTcvKDqfxGuXb1dVnqWtWkWpVLhdknMnw97vxsBWFiSTvXkrK4C2gMIhVKCAzrEvuoPBzdO/wlS771zDUHVqfJIU+epjrtG2Fxz998THlVKmoaSAzlh/Wr+6Yar/spwHYNU2lNtc4bEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425415; c=relaxed/simple;
	bh=WXIC7BXoL5VzZe6AB6ubEaNVlDunir6dDnybKM0E9Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5XQtlPliJcdke8AsEe6b3BWqLF4bEvBNVp+QJMxK6T8654FwvEAOhlZ5vK5gKbl/zsHvRrN+NLRRC1kXBhbkys+MM8eEo/8+hi3qr5Rb34XZjZNLACzWwzWMnTZ6wEEhpCuyKCWJYWLb+eme3ejY7OwDJ/gQ84BaQgcHOcjaSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pg2Q+48x; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pg2Q+48x"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a44b0ed780so46950991cf.3
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425413; x=1750030213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF4yjXSJrUcpYvv+fh7N1bp9yrQ9N5XG6Cs9FRn2x8Y=;
        b=Pg2Q+48x8JWyP1A584BhckBxp4IYKu2+qFOJQNVrv6uyjSHCx5dfSH+dOJRHiaLAIA
         6I44Pty+AVpKk+4fXfF/3uqpVhWzj18avk0jMyMKMjDYWHeB2KaY13h+IPiJ8q8uaiKv
         V70A7KB5Bd5oqq9M9rssPnXt+2X9BjNlHujxCJ340U1h+tUZ/UEndlM47PFG6M5wlolc
         fgaXhxcACeMRzDyNYFAOuyIqmdXH4FJn/xyh/5NUUm1wb0mDs8F1UaXi02Rff25ByTUE
         eiKLKJLEZrS2rK3xOl96jLdPl0SyFd5pJlOEjmXF0w10ha2ycmSmTzWFiLcHiLtQ1Vx2
         Bz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425413; x=1750030213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dF4yjXSJrUcpYvv+fh7N1bp9yrQ9N5XG6Cs9FRn2x8Y=;
        b=JDfP0lit06dXS+6G8y7MVJGAqA9mrfoP0U5Tp4DToBVLlj1KidYVsKgmOcl8lWcPHJ
         T97EZQdBCjR5DfGvW6ws8d74c3j4sYitnl7uM1fvqhPK9AqQIUrbbHiPSa0e2KTfx0Vx
         AhpSl9fs6Mb6BeMKOfgWAciCj3jddXiXXx+V7CCynq6k8WaiEKoV25tRbPYR/hb2yvVt
         5jGyjOCjMO23HmOfwBhxxFRLOXH8rhsPmp9kAIos6orR7pdOMW1au08NANzu4+RXA+us
         Qll65rHIPDEYFK4s+/KVcpFCAjKY3nyy2WaYnVlhoQM3jwIHQDr10rVht0kheb4hqA39
         +TZw==
X-Forwarded-Encrypted: i=1; AJvYcCXA80fJu4Vwk5hi9VwTm+vDN+/BQ2S6EmIm4Y7hAnKTQ8Mw4dW5CP57frjFyDI3VSlFqWUxuCY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiJ7KUqIQDu+1B5ptQgu1E0a/U8La3t74D48wLFW49q/ySeEkV
	0ilm5Zm4ZWKcxPewd2LIecOzdCEeCYFuR95kAbaf9ZmloOs8FOXpUG08
X-Gm-Gg: ASbGnctVa9qqNll9eeG6G2DO6EzfesM3AWDZLMm4vdVlX9Jf3vyWZQ2nky5W9cfxOxq
	ggrmjVSNIVbQIhgUszXuZd0guN+u2RTNNmYifLAHRgsfqg6I04oWOGNps0xVmgW2OLbl8h5Bz6X
	/eIIBed1DlkunhlvMG4NwpoUesEV0mjbjDwRRCg9FTgdGByQm8oVvTbJjC/XsNJZjvsRM+sB2K+
	Mc3ba6RO/sqlIcd4Vd8RC+gzRKwIGk4rkXKWGfXfThmBeGmF1MAU3GWJqM/Eep1+OwVi7mlp3Bm
	fk14hlEZdq+SV/a8eJXYJADiMXp5vCDQ/wpeMQ==
X-Google-Smtp-Source: AGHT+IFJtdD36SLKzA4s4tQ2l6v6xrhKbEE2YacMHc2B6BFbqlcLwe3sQC6STy67hHJv2b5IpjtjiA==
X-Received: by 2002:ac8:530e:0:b0:4a6:ef6d:d608 with SMTP id d75a77b69052e-4a6ef6dd6f2mr102198141cf.38.1749425413058;
        Sun, 08 Jun 2025 16:30:13 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a61115000bsm48297391cf.1.2025.06.08.16.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:30:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 09/11] riscv: dts: sophgo: sg2044: Add pinctrl device
Date: Mon,  9 Jun 2025 07:28:33 +0800
Message-ID: <20250608232836.784737-10-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pinctrl DT node and configuration for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index bbf4191fb87d..be20efd8e2ac 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/sophgo,sg2044-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/pinctrl-sg2044.h>
 
 #include "sg2044-cpus.dtsi"
 #include "sg2044-reset.h"
@@ -329,6 +330,11 @@ syscon: syscon@7050000000 {
 			clocks = <&osc>;
 		};
 
+		pinctrl: pinctrl@7050001000 {
+			compatible = "sophgo,sg2044-pinctrl";
+			reg = <0x70 0x50001000 0x0 0x1000>;
+		};
+
 		clk: clock-controller@7050002000 {
 			compatible = "sophgo,sg2044-clk";
 			reg = <0x70 0x50002000 0x0 0x1000>;
-- 
2.49.0

