Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D991459EA
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 01:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745976444; cv=none; b=mrxAQEiR1Tbub1IPZ+kBQXQbpMOCbPeP+wAus33ZzYCeHeW8tqREyjTg3LLQkjxhnt9O6ZdOqt7qmQIK4Zx/xRvR68AEstBYdusNs7AYHUNSl9r7u/hnJpcLQe93AAUxCS34EXMhCrWAtxDwqeDCVs5o8Yfh5y70FtmyfHDT/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745976444; c=relaxed/simple;
	bh=oLrJXf+oTPaFuw1R+UGVf0LwurCp9FHR2WDT2bGrqOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGfHEOlNKcJ0czjnmmxBm860gjqWN/qU2IyW2Qn12JZl51NV0sFsrcvIXft/TcJ4kwPgDMLukhl0t/2/vkaf3tnc7HN5nHdM9P9rX7kQbpjKRGNBJ2GloCM+zcS9iKQyMrZKFo0R9q6eVPXp7O+iNcTVQ75bOahpYEAw8ANlKl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYr2SUDv; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYr2SUDv"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f2b04a6169so73857526d6.1
        for <sophgo@lists.linux.dev>; Tue, 29 Apr 2025 18:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745976442; x=1746581242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFdInxkQRRqXxIK9R5g9volnP7PDwmASdVMI6EHAgag=;
        b=UYr2SUDv1WxTLTqKnFulJC7WxwVCrmzjT2mciVneViDVNbEMHHYlqcMtMzOFHiHJPd
         Tz2/W5cbgjmDOqzVkv/hqGL/IXiLsEUPhCFvq3PPLInSkrYFVFXx1yEqnoQ3liiEuXiO
         CH8T8pVpYpsQ8hZzX0dmYlzHbnFqle5R7i/zULPNQ5PZif+0AfFy+/CY0aniTxWC4iNP
         oTm432XmV4uaXKdlGHJCftgIlxV13t47efzWp/o6D5UhhUcxyfFS+taPu39D1fxSgRmK
         022lbRPX4Uhzq7iFiGXBFmCU1gDoao8PX9iHWtfc8ZEHgqNyNW/APZPv5CJIDwBDoBiJ
         B9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745976442; x=1746581242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFdInxkQRRqXxIK9R5g9volnP7PDwmASdVMI6EHAgag=;
        b=ibosK5NY/ChxxNyaKal3uw5f+eFLy7xHnLn0S9JQ7V6gxwZuzalqhQPypFZXJCJfnA
         0O1LUonyKVSXWlQJHjYNfoKU5BDLViOHv7zoQHKoZyWRLZUFBnvt+vHheh889epQ0sIR
         TQboEJhTm8rjx1xCAA0NyOTLMD7Rs2oKfqS6pzwozYSaTd+qhZbXExIXifEJiCe5hIAc
         9kz/yhCybqWkD0wI0+/ZaZSavbyJwhNJIg91lU3v256BZj+JlrqNwlKcjU9rKNKYDAp6
         +f4m3c/DJDZfckvT1zDkQxE3VBhbOJMb8nE4fCyUjjukEwtEU8rhJGtV3NmbydrW71nK
         aaRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1wgoJ2HWltj6q6waepfq1sRl6zabDTH0gwrXAMQXm6Nh2uqW8Ug8aV2OvhNX3v9r+WLxcenU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdzrcjNgBDAciwDnYCXPpanQ1eFcICpf+QQ0rFETB9NM8TXeBU
	OZykj+7lheDgHypxJ7EhkawaIY9d+vyJ3kIIq5ujMKZAenPDk8tx
X-Gm-Gg: ASbGncs1efBe74F+QShqYWogy1DhPsn7lhs3/oebed9+8IZJAFMYOc1QLwnJqr0gb64
	XK73CoJJTEkJRn6cFC+ObneRwsVszeHVZEcU3GDzvQa56oUwppzMaCcoK+pntJz7UZIFf+EpqYF
	9YL6Nxi0uCC0peJ0/GCYBFl6LdN+zvDFqPGybqEr1Ip3dTr6+Ti6kQFUk2VSWl6odh0gpdxn4bO
	vD3QLp22pIOyDW3/8FT5+rtEl34uzKcAOIJuq3pMi7ghf4velTB7AXzD+lTxsdMzvet8E3rcNzh
	1xq9rg1m7hc0cn3j
X-Google-Smtp-Source: AGHT+IErHP+u9m+10UhFsdEDYpZ7RXhR8Mft3aysrMdYT3o5qiteXPfTKpshT1+zn+nRc725/C/wkw==
X-Received: by 2002:a05:6214:492:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-6f4fe03b414mr18225756d6.5.1745976441775;
        Tue, 29 Apr 2025 18:27:21 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c958cbfb1bsm797310785a.44.2025.04.29.18.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:27:21 -0700 (PDT)
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
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/4] riscv: dts: sophgo: rename header file cv18xx.dtsi to cv180x.dtsi
Date: Wed, 30 Apr 2025 09:26:52 +0800
Message-ID: <20250430012654.235830-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430012654.235830-1-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the cv18xx.dtsi serves as a common peripheral header for all
riscv cv180x/cv181x/sg200x SoCs, it not cover the entire cv18xx
series as there is cv182x and cv183x. So rename the header file
to make it precise.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi                 | 2 +-
 arch/riscv/boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi} | 0
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi                 | 2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi                  | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/riscv/boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi} (100%)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index 91bf4563e1f9..d0a627c086fb 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -5,7 +5,7 @@
 
 #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
 #include "cv180x-cpus.dtsi"
-#include "cv18xx.dtsi"
+#include "cv180x.dtsi"
 
 / {
 	compatible = "sophgo,cv1800b";
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
similarity index 100%
rename from arch/riscv/boot/dts/sophgo/cv18xx.dtsi
rename to arch/riscv/boot/dts/sophgo/cv180x.dtsi
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index cc094b3f585f..d9580a2e1e7f 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -6,7 +6,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
 #include "cv180x-cpus.dtsi"
-#include "cv18xx.dtsi"
+#include "cv180x.dtsi"
 #include "cv181x.dtsi"
 
 / {
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 6f02de9b0982..60709df12a22 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -6,7 +6,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-sg2002.h>
 #include "cv180x-cpus.dtsi"
-#include "cv18xx.dtsi"
+#include "cv180x.dtsi"
 #include "cv181x.dtsi"
 
 / {
-- 
2.49.0

