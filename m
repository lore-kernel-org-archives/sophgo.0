Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251751A8412
	for <sophgo@lists.linux.dev>; Sun,  4 May 2025 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746355584; cv=none; b=t6FZfrGcZfJHFS/aiaWIhmDSIVoxFsd7dBic4PJAnzdS+91IPMVXkOpmbr6yzaXlopc1uQ/7S10H93W/FBehn/Tre0xvEYDnWlwicNTTxgzd1yBvMnTE8etVdXuZiIwBrWgkt1Kizt4HGUH/ji5sfPmdg8RUXRUDG/WqbU8dEi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746355584; c=relaxed/simple;
	bh=IOUbTpGZZeI+nBZmuxYvdduSXGQt/jXYcXqsGvwMSC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p5kGDpY4L8z6CBfxp+5JwWRiBJp4Gpwh98OwoVtETMM/c7LCQ2PZlyksTz/hgBwryBCfa95cZ7zNn5jKh/qcnRZG7YcApZKWBsAb6PIzCSWRWCG7Owy1LYz7+WOO4vQtfsbBCGW981AJ6dmz6spR4DfobU8RY6GqPdhZV1TNino=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+lTE9yE; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+lTE9yE"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5a88b34a6so378661185a.3
        for <sophgo@lists.linux.dev>; Sun, 04 May 2025 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746355581; x=1746960381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0dBNsRLfozNYsO2JqfQXy110W8bkOtUjtTaQB8elP4=;
        b=X+lTE9yEo/WPR2eXFa3PLK3E/9ouvgL5h2gjB8Iqn+IKVtm/H8CCODb2e4XdAWq5HH
         EUDklQlPvxNLlWWA0JdECGxAf/SrgLsbydsMWvjSFruHC2dxAgyiKd9pGO+v3O/dR4gF
         /7YgwBIcgYNSNLbkK23qHecYVvhC5cGyXK+quiUDUrTG/FFz31zVxOIaO4o8BqCQpYrG
         j/YWqkpom+dbl1jwvtuZgOUDM/YXZ84CkTC6RsaM5d4Enj7a2CQ4YekPqqwcNKycuudd
         Wm4BY4/meQP6uc9YoVq6qrqVK/UB59m1qJFBkST15vw4dqbluLc02fiZXzE4uZmW6jhy
         +qBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355581; x=1746960381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0dBNsRLfozNYsO2JqfQXy110W8bkOtUjtTaQB8elP4=;
        b=b3b1S3Vi+chu/AcATqNt6LaB7gYUt/0HMnhTxKTnTdYpzUW6SfxvYfOzBIpMS7K0Cc
         uxsHZfik8dum9KMW2DX5uS0ICAN4a8nv+LZfcKrCVn3mh1BkYzu14Gn3xesm97+vsWw+
         8khwZVyGsFpZt0+r/fBjmrvPG49zfdDVZfn0iHUn9JzYV5CBrCyoxWcAwGrMOkrr+Qoy
         Glva/3ny4TDcbXN2eP87dEEsHHZ5yq4QGjAEH/XR9Yf7Gpoe9Be9E4YOLxP62cKnLZ8V
         WkgodH7KRzuN+LfVDum4TQKwwKaoPB/Jcpomz7K4Qzhs7SNgbtNnWRXOSxEPfg3+50G+
         K5rg==
X-Forwarded-Encrypted: i=1; AJvYcCW8YdCQfiBGi7u3udVvP59DcCewLgSu4LIroaZu3tIFP6rgAzkWCYKfujcPyJTpNkXrgMaZHEs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwpqJJS+8RdO81qhkrgLHb2N0sut/RPchgn/p3mapWVOwy1G6e
	NBmOwIAuFOFVEl7XVonBKbA2dTZLzKV4TXgFI9XpjVwni1gXe45+
X-Gm-Gg: ASbGnctzXIv6UuMZd8+caQMwBdpGEt5CykZ9mc6HbBXbR2Vqc0I8itcBbCoZ0GqPq0T
	1OTvPako9OfFhHwVD+EiK7pvywgmwsuTeozTFOl/wZ/9kboo2yC2v8aEHmE1IaqLd4lNMgwJRzp
	Et8gcsOEKCquRpHQf2XtQS36kaYeLyTvDZhCHZF7ubxC8yP1GDWHW+AaqzZhjkAFVov6IJBFgDS
	E0nrxQ2SCN2CDy/ZFpbWCuxoj89s6iJHGO7cCokHpgvxTETdz3wg81oAQ2lJsJtBRZAhKvxT1Nv
	XFxzSaYIkbnkyG4m
X-Google-Smtp-Source: AGHT+IGYfcJI1KOo4mnYSm2aZ/wO68fNQbksb1q2N85JkbNZoHHGaOY6wCLzQBxd67wnG1djUIGKBQ==
X-Received: by 2002:a05:620a:2a10:b0:7c5:99f9:6ada with SMTP id af79cd13be357-7cae3b0a53cmr471104785a.50.1746355580956;
        Sun, 04 May 2025 03:46:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad23b5f46sm429527585a.20.2025.05.04.03.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:46:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: sophgo: Use precise compatible for CV1800 series SoC
Date: Sun,  4 May 2025 18:45:50 +0800
Message-ID: <20250504104553.1447819-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As previous binding uses a wildcard compatible for existed clock device
of CV1800 series SoC, it is not suitable for existed requirement. The
only exception is sophgo,sg2000-clk, it does match a real device, so
keep it as is.

Add new precise compatible for existed clock devices of CV1800 series
SoCs and make old wildcard compatible deprecated.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/clock/sophgo,cv1800-clk.yaml        | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
index 59ef41adb539..379ce3e9e391 100644
--- a/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
@@ -11,10 +11,18 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - sophgo,cv1800-clk
-      - sophgo,cv1810-clk
-      - sophgo,sg2000-clk
+    oneOf:
+      - enum:
+          - sophgo,cv1800b-clk
+          - sophgo,cv1812h-clk
+          - sophgo,sg2000-clk
+      - items:
+          - const: sophgo,sg2002-clk
+          - const: sophgo,sg2000-clk
+      - const: sophgo,cv1800-clk
+        deprecated: true
+      - const: sophgo,cv1810-clk
+        deprecated: true
 
   reg:
     maxItems: 1
-- 
2.49.0

