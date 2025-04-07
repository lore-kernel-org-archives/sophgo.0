Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337FA1B87E2
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 01:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988045; cv=none; b=KZxS0TVp6y8TxwNfeSAI2Tu+v6yKSNOSURcKc3/MKyklDc4suKn300EKpBoZDzt68JuFSXG0jNwfGMf/nIFPxiOX2kSrVJGURM/D4SJaoqNw5mKcXInnRZuyMestu3aNTzJVf/B1uitvKZ35pq1wM5YiNBDt+XmEV7libMN32fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988045; c=relaxed/simple;
	bh=popsEnpdviwZkd0Dtrr75Wt3oDa3FPnEI9/NClYd4xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5sFC/uj1ssjt5+R5KyCH7txcvu6Y0WLnU2Jwe+a01xg8v9tu4NtmOKp2po+zi1RrD2X6ybMeUi6v3ahRkM7zufZ4Nl4WYpUoll8wODEu4R8EM4g1ArwN07Ilmgj6kmzAF29cSnElV/czdJZMcSdYtqytKpErIHT3Sd96RJtRNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNZsYlK4; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNZsYlK4"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so48357066d6.3
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 18:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988043; x=1744592843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fgr0LN814PpxiHyiT7OJDCs0PtpZxoE4k4904FmXN1A=;
        b=GNZsYlK4STcOtd5bSzqxZbB7V5LYxYHrS6pCUQVxsu5wC6W8Q4o+EZc7gecBIEyQO0
         8e1j8xzMFUR79xQmZlzZX6AlxSljVt36tyHy5lm9Ikuf5l7BPfeXHQ65PyrgKlPKZRPp
         9mpLnL11sSJoVIRR82l/tOBaFNcl4NFoI4xTIylj8y9gFWV6o+DOGBQl1TozKsFbhttf
         vWG+MxSRDrriAME8J7ARSxrBr5EYt09G+1wr4eFVfHPYPhFBUd3bwJiuVAFO34LDkm2S
         FuYjOpw/8iJK2ClGcT4YpYoVzXsqF6Dn6Fmpz2TZxeZKWlPYAAezqFgJBWr22gWbODTf
         KJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988043; x=1744592843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fgr0LN814PpxiHyiT7OJDCs0PtpZxoE4k4904FmXN1A=;
        b=NacvFAroon82tNhRMyP92M5hL7aciGh+3GiaAFkbOqEvrpdmUkifERj6BkrkotCeKH
         cen+SEb61ua9D3PVoabBw3Fw3ZEXAgTClF88sCbn+63kPZdcy9Y6uheN0dntBYUhpNVJ
         818xgNrp3FSeMEZjCTCwQF0t+90jNU7v/ABtVC5SLwNxJtN07F/QeMj2lCOldGW2v+VH
         SU5D14Kgfz6sE4DEjOyMqbDV5Yj2+1CM+mRP9CZqDBlarKfuWGucfTqF1QpgwUj3k3bd
         u9nwDVfwufXwBiGKn9EyBtLpReHGmba2jebMhdX21vUA6AypuyEd1Dc9/QdnLqYxRuYb
         6EiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUEuXkFyud1nVhpkgowYnH4bGFTReO5BClHXImZxc2T2fnr+VDF++m8nEazNxPtLsinn6Ciaw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMUjUCC6UTSdJVsLTwcGU19QnVuuekRqXSXcy5gUJuBjTMSIT/
	/UYcetdQu0N0sOFMJrj4ctMK2fCwqVcbVwCMwZiFGfPZpnM7p4+8
X-Gm-Gg: ASbGncsd0s4td5h0PwUsW22fRJp7rS/tYMK2yTc6BZaSD381z7r+wsthmjMwifrXHcF
	Xi0bVVNENAQ5CYL6HonybI7umIjhfzsM0vSR6A3plmdfjUk76/aAizC1DvjVxeOV1x5FUBKvOWd
	fNyVIMLDEwJ0i/CoQ6tSTMV1EyzaH6iWleCagtF7I89z+IrqpVMS49HzZNKnfHCa2V9a3oVakHp
	SemHDG6OwyI+1rt7CgB92m3S7kYJxN2f2i+chCtHUHAns9LvNddFl0AICMtYqdBtq3V/lupyPk1
	9fP0aWGRRBkKVj3CRKGG
X-Google-Smtp-Source: AGHT+IHUbWneKrGAUPwQnZkxyFwqsL7dFlvzrPr8w+sNokg1K3CrLnlYjlNIEnDh2HEVz8EqSTmwBQ==
X-Received: by 2002:ad4:574a:0:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6f01e794739mr119268666d6.29.1743988042941;
        Sun, 06 Apr 2025 18:07:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f047c9asm51783546d6.59.2025.04.06.18.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 8/9] dt-bindings: riscv: sophgo: Add SG2044 compatible string
Date: Mon,  7 Apr 2025 09:06:13 +0800
Message-ID: <20250407010616.749833-9-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the Sophgo SG2044 SoC and the SRD3-10
board.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index a14cb10ff3f0..b4c4d7a7d7ad 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -35,6 +35,10 @@ properties:
           - enum:
               - milkv,pioneer
           - const: sophgo,sg2042
+      - items:
+          - enum:
+              - sophgo,srd3-10
+          - const: sophgo,sg2044
 
 additionalProperties: true
 
-- 
2.49.0

