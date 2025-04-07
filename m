Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E148B39ACC
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 01:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743988020; cv=none; b=WvkbOBIMxXpdz0KUwJnk3q87Io6F+ctAt1A6+Cy6BcjRM7raJPP8NpnCLnQdjLxOHm4Sz74Y8ViQ5ob9dzyDlE7jTN0WGbMISXVBHOVhIKw5wnAwcYD3FmFUsm8l53v2E0KH9lvb46hhSS1cR6TUCePd5176deCthA1I1yMSXbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743988020; c=relaxed/simple;
	bh=67Xb0cRe3kqLGS8vDJK44RPpdgPBDQqj7cmtau1ZK38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=allbi91nvKxysUYttI6+tE8cLbpy7pB0IE3LUKVKe6txqTWiUknuzBxSQSmh/X2SQIYq5QSfUBYpgqyo8n58tS4V67Im9NSpztljz9RIGOhhuXasxMtk3cA0fyA+dqQ4IkhgFZJNQenPJ9MEfSEFirvHf3cLkWOrZPJVNuTXb/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vjjzr5Ry; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vjjzr5Ry"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47691d82bfbso80912321cf.0
        for <sophgo@lists.linux.dev>; Sun, 06 Apr 2025 18:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988018; x=1744592818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFs5RauZ5QOy8Ab3T4kUtd0LneBhBgJkwOZmpV0EdcU=;
        b=Vjjzr5RyK9SnpOv9ZhtMXIONof03qT27EVPpMFKdcdWL0At/hs89mWmbRtUcCijFDg
         5c1FE283qWP1tcnenNeQzFq4BPqg3NrDysb2S9s9KjU5k1IYcUMvKXNK2lwcMJqgULGs
         wLwEC1e8u9aB7HfExR6gzg8wHG3L20ev4LTG+OOCeCNflptR3YmP4eZbaULZqn+FnfYm
         jioa1s7PjnZYywN6wDeYsAsfn0r9j2N5jmN8OFChpBKd3HZ+VkcHTwO01IX+e0pn7UdN
         vIzdHMTNwnz+ajBhmS7fgs7nr7ZAgfrFXrLncJlJTaRuzCxfDff26nwGgOKcsRz4Orup
         e/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988018; x=1744592818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFs5RauZ5QOy8Ab3T4kUtd0LneBhBgJkwOZmpV0EdcU=;
        b=luhJkyLi42oSGM89O7y5aVwvOXg82uaPs9PQMiHDRJkwvysGcLshVjKK9VeqDQFY8j
         R6nrHUB5AqBRja9Ur2cx6j9RMbNyzAhTR0LvpFf9KcFebhPGFN84xWUfRT5WjDjceh4B
         8xxTYNYwDPeS+SSzcbxIExc+9UtJWQq6YMVn8Hp4tKYdq3Un+JtYEzG60+CE6m1+TKPA
         wF7Cp7JF3MEzaur2p0v/7HeoO78FLuYAM+GWhww5IfJLRyJDyot8jj1I3ObIj+OVztBa
         LVHsUNCPPTO7TK8RKzuiJ63wI4qt/tD7P1AELE8N3+AtP/OT8dmyifAIEBh1CAHAd7rR
         D3bg==
X-Forwarded-Encrypted: i=1; AJvYcCXYypaU7qe2s1u+DcEfhvyUeLjNJanew8obF1INw9AAYOP6mq7BrEZfZLDjqw6nYno5F3/+jUk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlK9gPziIjxr6y5VPZHYG9U06EfnccoeEP+iDbmg96wFKUCi+k
	nhuan23Ct64ilJKLboMJ4LntAI9depjFfwjR2UYk6cMhsQ6qJOzm
X-Gm-Gg: ASbGncsW9mZVkCcz0qV9W/uDKW530wrWXwasNA3kPjhxbRud7kUDX8Q7Ni0ESa96x04
	5KaD6b9PQ0JIf+En/AdBLyp9oBCOfKTPFYpviDe/geKjw+s5GA8kAWL19jjACbyPsS14NveChi1
	VLW0qPKyg85NpbjsxA/H8OXfsZXWxTSUwJ/YRuXmuglL4cEAKl5nGVqlG0OQVWtCKDHqvMu4mAw
	OWRa4O8JSdtug4bpk4pXSLSTPRqPC6LJoDTWh2asAylgTb70JyegNlygHtDtEMFNllGEegKT2O7
	H0M1NmfW99jHW5Ci/4vV
X-Google-Smtp-Source: AGHT+IGThLD0f1Wc+dVeoU1jl4PtajVlgXRPCMJv4ypnlzRq3f4lx9CHT6fpIIMYrngbXMnRUpODkA==
X-Received: by 2002:a05:622a:48f:b0:476:add4:d2c0 with SMTP id d75a77b69052e-479249a7edcmr176008051cf.35.1743988017797;
        Sun, 06 Apr 2025 18:06:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b1266aesm53295311cf.64.2025.04.06.18.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:06:56 -0700 (PDT)
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
Subject: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
Date: Mon,  7 Apr 2025 09:06:06 +0800
Message-ID: <20250407010616.749833-2-inochiama@gmail.com>
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

Like SG2042, SG2044 implements an enhanced ACLINT, so add necessary
compatible string for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index 2e92bcdeb423..4ed30efe4052 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - sophgo,sg2042-aclint-mtimer
+          - sophgo,sg2044-aclint-mtimer
       - const: thead,c900-aclint-mtimer
 
   reg:
-- 
2.49.0

