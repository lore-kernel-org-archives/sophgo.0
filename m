Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E88C1CD15
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 01:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988024; cv=none; b=AtI8427KkdzNnczJwGG/0uJfum+z6a4zXlGPyGpHc/TvItje4XfMZVKO2R5Q9ZD19AOfjtrilexrBi+Z14MsOfurSfgG/0S+npEidF98yXi/cBC+7/LIvexyB5vx3mYf/DQgBKmpYP1m6QN7MFnG9KBjWPSYt344bkeBZS26wNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988024; c=relaxed/simple;
	bh=zCo+Qwlnj+LFgJZXj+07HKs/ViAYB0ypXv4DMwLQ9CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUUsaSygH7+A/LTXDG5yxUPp7Pxu5wg9Ch5WVt47/FRRx/ZsAIdoNRMX1u3pKfEonV/hOrzAxcAE9RQCE0GPI2wgvO+9kvfaQKU4KXv05BuIz2EgeMUFyE6BOf8BS7SRZq/UDtrQbuCocTJK3FScdNjt7MeUbV4poSU/WhsTLH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkHt6ZWT; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkHt6ZWT"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c55500d08cso362861985a.0
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 18:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988021; x=1744592821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siqPQU+FyAku8vhhn3ZUC1oR8uSZvTqCHGJlE8+8NrQ=;
        b=GkHt6ZWTA8SgW4JYVaRGSqlkCTkZKhYTe1ro7SKwgH0hbR+P1q8SVX2v8kSnSpUUFY
         MGsdxQt/UcO2WBZEENTOTyWA9EraipoapVupTPPcohDfRbWMN5Hjp4s0SMfxNrF3rasv
         QfPltoN4bUmdxhb5kvGx7Hq8QBOfsaIICwHJbu6DGb7lY30GoU1LxVflzbcoNREsFEwv
         xbji7G/bZLvI5EGgcJC4PME5zXzBKf10ke6SV2gl4+4UKrJn+HMoAuQtmtTvYuRF3wrd
         5qPPknDckE0n3Wf/E7m82EFxJYynBDy/VJ52IpIxtBIsaFL8Lv5PG/Hh9KNp0tpGZtg0
         Djog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988021; x=1744592821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siqPQU+FyAku8vhhn3ZUC1oR8uSZvTqCHGJlE8+8NrQ=;
        b=vtFzTed4wC65+o7mwuE2M70tEC0eou1dy3Rb14tv4G9xBLRD/Sy4buwS6SJPC1/nzD
         Vn7gNrVDkNTZGVBVU1HxfnuKqzW+tNTpWzMFhQ/6mJ2U/uy483QA06+nzsB+E/k6/8F5
         tM6LXMu/gWdL8ZweIJIRLbZ5kZKxOoY77excEHJy0ZAV2ubZy0ILj4ofgAowKsLmi+lg
         5Almj840D2KcQTzYwHDvuxTl/1alEv1Y9gMWf0ZQIa/T2dsnwK0cEkWFmtjlmTdz1BuD
         8g3b4BWd0B4741MXy4BvxEaFrtqkWveiG+ODEM+2yLVkB5DLQVmQLVDJbjQ4x3MSQVB2
         CCvA==
X-Forwarded-Encrypted: i=1; AJvYcCUNTR1tzGFXpWEmk2lG7cjZeAyjXTsxlpXptJPGztZr5tbylm7AmP8OPNmmWUjGfFoEHjHMI8I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPvr8d2pFBT8oW1IFyFqazjN/ZYuqw2huuyyHb5+oEkBnXb12N
	6G5p3ZhVglgP6R6O4NGJhSWOtgo5+7aWrBR0GxqxfJ3lLrUlZjO2
X-Gm-Gg: ASbGncvaU01/XfbXjHITNv/4weoRI1XpJ18cjLt+7UPr/ps9tgO1/M4PKqqncgn8wTh
	bFBlUmfyobhASb8IfYP4GBz6vezSKrOUO2f24c//YDGKWaO4O9dojJiG79Dyde8xB/u+hXtjQ9f
	5X3vhDAlxY7AsXDhD7HdvS32a6y4EiRkXOnJVfzHOwmoHMwtMz4Atyk3usS0HxVePAoler2My8d
	aGS9g4mDcQGxUTsktbm4Xig0UF5Hdesx8GZumkuBt6ruE9/nxUVeGua4ohuAmyubyf/OOqTQgTd
	OiBLhsDGVx50g8uP10ja
X-Google-Smtp-Source: AGHT+IHOF406ZAY4FtFhD2l8xlyDvh5PHaA+xtI7orTdCQHDTm8ZGVImUr8k5ecrmbJiiqwwrdv5HQ==
X-Received: by 2002:a05:620a:280a:b0:7c5:a5cc:bcb9 with SMTP id af79cd13be357-7c77dddd878mr1080915485a.56.1743988021428;
        Sun, 06 Apr 2025 18:07:01 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e96cf01sm528160285a.55.2025.04.06.18.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:01 -0700 (PDT)
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
Subject: [PATCH 2/9] dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
Date: Mon,  7 Apr 2025 09:06:07 +0800
Message-ID: <20250407010616.749833-3-inochiama@gmail.com>
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

As SG2044 also implements an enhanced ACLINT as SG204, add necessary
compatible string for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/interrupt-controller/thead,c900-aclint-mswi.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index 065f2544b63b..d6fb08a54167 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - sophgo,sg2042-aclint-mswi
+          - sophgo,sg2044-aclint-mswi
       - const: thead,c900-aclint-mswi
 
   reg:
-- 
2.49.0

