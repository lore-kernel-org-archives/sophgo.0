Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327B7264A77;
	Tue, 10 Jun 2025 20:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586362; cv=none; b=KyM16g6nxp4iguMj9yEB9a0EzErG24qejBpi3213wwPmriBllXskF2wR7cgoKq8BzHO9yijBbp8CCsKEqH2Xy/ld+as6zL3LgQ8/b/dPKWDlPS9XhOMLkM2o9FnnBs3z9NnwC/mT5pJ12gEhV8Q3SgM3kgnC9K6CUUfCXrlwzeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586362; c=relaxed/simple;
	bh=MUAMt7IyYN6ZQmmkvlBMzdYo8IOrzdeKO1Ry14nP/ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/amTbLLOTPr5hTGnBr+RCOdim/Dm0/aF0FesrverwUKbB5O+UDY7whZJ3IC7YYEyhmbKhudGwJPljn4m3fmtTLam+oaH4yO9aWeX+ED1y7UE0VQvk6Ppbm2aIxoIEFu1BvhINR2M9ygLGSKdtC5tCTFdm3GdAu6CeQV7laiXSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPrGkMIw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPrGkMIw"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-441ab63a415so61532625e9.3;
        Tue, 10 Jun 2025 13:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586357; x=1750191157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=;
        b=ZPrGkMIw+ijE8pZiqQfnrRhnom/HWLBhCdfS4A5DW3HzzPraeQXIveFM8+DFg9TmPf
         Xq6h3I6XdZFCVApSGq4JDg1/WcAb4IhcJ5rBjVpKeiEIn168AEKVh+nMh1G+PDlxOof7
         wPRUqzbmjJ57jxGCKaNLvD/YJHLNR/WJL264SxmvUf6ZVknmgpVViSMrkHA3vr9IBRHU
         Gvjw9j4KXzgMY+PxJDDdMMtKtAjSKWKQ64antnKtiZ8YF22BGNn0hM1ljTzJQ+ZfMybo
         fONmzkOxvHGJ18fn93ab6EYNy9Fop+EY1ZiiYbHVDQ4KkIml7V5HeSCX7lmrsyuEaqZh
         isjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586357; x=1750191157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOPYLp+PqOhl2kEAzLxqmfQbbvicZ5KyaycY/d7WX+U=;
        b=RR+dMfxIHQoRYRnNYf0X9hD4LeAaPfOyLsoopqn9zCj2LKtmOoQw5ppScdsDtyVADn
         IJLYca7aHj/azsR+vPLJ0lHvY29KNHZjqKy2bqviiju9ZvyE382HvAWIEau1kf5W/Ojz
         kY1w6ZI/bfY2WUHqizzgw0hG+NNE2Ai/YPDHAuq4/83KMwX/BJFlglDZ7zn2R+6ayqxN
         4fL1Ax7Er0MwJuJw0eoeZP/6Cy9ZPBI3gnveYbMBKXJoh7V8a4DMtnhFc42jPE0y8VVD
         NZbJmebkixyAUZc1fnCcqgHngTnTPGgYMdRMrIg5lQ56bdddXnmmgrq3/41huHvN41QK
         5fdw==
X-Forwarded-Encrypted: i=1; AJvYcCU95mVhKw6JqXLhRjFyYMu8cKKVwFOyDI8pFG0mDzXBTUc4FIEJcwoJCLK2DhwqgDch9zQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQww0cyJ6nW+dWhSaKSkJ1Bcki9lnQhnhNcU/g7pQZtXehRuuW
	61435YQdhaTlVK+jQwVUinH3QbPi7CIoKyUmCAqq+o0bI0S8XB2wcV7rWFEAJy6z7UQ=
X-Gm-Gg: ASbGnctzK4syctrBp106vM8+Zz3YNvViX62ylVCXNzteQVnc+fU3ZPFnMj/e3MNCwht
	2y1j9mfhjQyeteQwUFS+1pD4HJHYB8GFsvWXH03f2llyWJF4NDlSC2Ql91lLPp5cVNBuVZfcsuW
	FD27E+T/QZ+zbmjTLwXps68pQopuvdUI1NuLpGZ+L56xkci+/zI8+6Fbc/Y+HKvtnkejywjZpA/
	ki6xXXm6ZjmSps88PX2UFVYDrD41L6det9SoGkBCgPVJfQg/e14Mj0+u5FNuLy8Z/9QXQBfTa9e
	M9zuzNZ+oooqVEcadDhceJxk4SOIpEXwTXjk/bTKZEjcHb3USmMZSILVqORpMYw2FUnqiwEHef4
	=
X-Google-Smtp-Source: AGHT+IHuckGoI1j/EMl7lkrmT2zOOTmsg2Sb/9pg87R2veE+HZJovaI1z2FzlALGyE6dPK28uuYIUw==
X-Received: by 2002:a05:600c:354d:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-453248e1002mr3364435e9.32.1749586357157;
        Tue, 10 Jun 2025 13:12:37 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:36 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/6] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
Date: Tue, 10 Jun 2025 22:12:14 +0200
Message-ID: <20250610201241.730983-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move sophgo.yaml from riscv into soc/sophgo so that it can be shared for
all SoCs containing ARM cores as well. This already applies to SG2002.

Add SG2000 SoC, Milk-V Duo Module 01 and Milk-V Module 01 EVB.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml  | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
similarity index 81%
rename from Documentation/devicetree/bindings/riscv/sophgo.yaml
rename to Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index b4c4d7a7d7ad..602c092b4ad5 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/riscv/sophgo.yaml#
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Sophgo SoC-based boards
@@ -26,6 +26,11 @@ properties:
           - enum:
               - sophgo,huashan-pi
           - const: sophgo,cv1812h
+      - items:
+          - enum:
+              - milkv,duo-module-01-evb
+          - const: milkv,duo-module-01
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.49.0

