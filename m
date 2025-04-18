Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAE085626
	for <sophgo@lists.linux.dev>; Fri, 18 Apr 2025 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744943414; cv=none; b=fYc0o+NFh0TSmgXqUKlaXLnYBdcBmRD9ynOT3xnCQ/R/xl9g0Z0RyPIPSwH/vN+t3SfD7hgqhnmWAZURekR0dy52CPZDwQhybBJgAtCvKVcVWma0NVF0vGmVw7P0gSuLFLSTi/UVBcF+z3nBuAtG+Q7/jQ7vjjeQPQ02McF7XO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744943414; c=relaxed/simple;
	bh=Uiv/WdyiM6ZLD1iD9O2Piqy+yeK2HAB4dBLGWKd3yfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LT9Uf46qqomL7lJWsVsv3pOxG2WmXn6S1O/4DIeyo2u1yAihwn3YZzIG9xflM41M3LLsQFNyqbuoDIxgIjSTQ4g+Stw7QxL45LsWVAedS3fCvgg2PXmCkKcB4qVVbwiu6IMm5GQ0y9AVQRtluPmrSyx5v//QTmAwrtm1m7rOsTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXX5Jm6K; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXX5Jm6K"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af59c920d32so1011256a12.0
        for <sophgo@lists.linux.dev>; Thu, 17 Apr 2025 19:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744943412; x=1745548212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5U2m/1zIwftem6ijc0txeow0NVnpRTFEaq+AmNYeLGE=;
        b=YXX5Jm6KqOCIbIRCIhqewFrYsP+m446fYncwx9bZqQ4L7a10Y3pUN5twbS8fBS4kQy
         1q9v/LoO3tMjfWzzIjyCvzolNHnuYPYgd0rK1fb0m47FARQzdNyLN+67yWQ0FfKu/yg4
         Ooqx46iRnYPbTYKbfpmOCfH0rLFyrrQ76G9+1t0FUTyhnymGpb3DURljEoojJqDAX2fO
         MhZhNwoA9GZA2jMJJVBUxv02AaSN/KeY2JClew2uBYz6VUqgW5VjA35kC99Du1m89D+e
         mCzn4VKuUG3OR5A4pSoO5rnywAlVQTqJi1iTfqbzgCYjZ2l5cu6PB7mMJ1x6aBOtVOFd
         7/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744943412; x=1745548212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5U2m/1zIwftem6ijc0txeow0NVnpRTFEaq+AmNYeLGE=;
        b=Qu5ulFb1Zc7dd2dl+yBxYctQx7atA49CK/l3sC3/pahnxFibWu4XP3hLTShtZxVNbi
         9rDAVD2lw52tC5RaDXUWTLFEFLolABX4UUt+u7q3NdFLvfuoSi+OpU9yDxUvjo3v1nnH
         A8F/cGenbo40Aw0ErQfyowRlx7frjqzU3uPom32CnzMzZaS05ByE0AAnAFM58Yx7jlo8
         pMD8neRn/yo5uRKwDXpGOSeURKve5TWsuetIQBaw4qNq5jOkyf7ZU8AO/L/NiMt3Ge9O
         jTXrtn8DNu8gwQb3YH+4cMHrcIGYpINWHhJ1X5oOCoLCuTIQV3eRd8N8/7M3FnFtgKA/
         00PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGklk9Fgvth0bqdMKnaW4t88w18muZHrX/TMzwAeR87cnKRxyBTq78lzvzxOo9ElwauhSosdE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+DkwuohGQ9lrN0J0FAmsTMfedCzb1kUJ7d4dX+EG477kdwIdW
	gZlSMY94M/pfSKVHOwuU5FTNnlBPLLWbD0qpBjOFm6UTTurQxttk
X-Gm-Gg: ASbGnctU/CCXIWylmI81ZVDZPh5D5MzVfkoLJAmmZpFnvxgwt2U70hd9pamXjzsLh0U
	YwdYHFyNe/k8+tzAtlXoXsnC5wx+rJlwxG+XG5KLbi7z7K9NiFlK3I1HTcuJ7TY5ksidQziBcJW
	nKoCJlk5CJYnmj10FP0rnHPk9bbX83GZseIJIW1n+mOvvwBDAcK6h0SlEHL5cx5dnVJTxOLc5PQ
	MEwuqwP5ltqkQhTqBKkN7nfxh7RQLojLBrDcC7HwDm8Br8ctfLgIkSYVZl36LAEa4yMhsNkgNGA
	ZwVCru9vWCX6cIG4pt1CNdEcsals07wzkOwaTM6Pnv2mZQ==
X-Google-Smtp-Source: AGHT+IEx1z4qiAeTBtr7S7/FGS2j/mqRRRu2uEicuvNdRBKYecwQYjYYbj1Nrv2sWaIQGpfTFyTyeA==
X-Received: by 2002:a17:90b:1f8c:b0:2ff:5ed8:83d0 with SMTP id 98e67ed59e1d1-3087bb631d7mr1870914a91.16.1744943412361;
        Thu, 17 Apr 2025 19:30:12 -0700 (PDT)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df0c14esm182185a91.19.2025.04.17.19.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 19:30:12 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] riscv: pwm: sophgo: add pwm support for SG2044
Date: Fri, 18 Apr 2025 10:29:43 +0800
Message-ID: <20250418022948.22853-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds PWM controller support for four independent
PWM channel outputs.

---

Changes in v2:

  - Modify variable naming and code logic.
  - update "MODULE_AUTHOR".

Changes in v1:
  You can simply review or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/20250407072056.8629-1-looong.bin@gmail.com/ [1]
---

Longbin Li (3):
  pwm: sophgo: reorganize the code structure
  pwm: sophgo: add driver for SG2044
  dt-bindings: pwm: sophgo: add pwm controller for SG2044

 .../bindings/pwm/sophgo,sg2042-pwm.yaml       |   4 +-
 drivers/pwm/pwm-sophgo-sg2042.c               | 151 ++++++++++++++----
 2 files changed, 125 insertions(+), 30 deletions(-)

--
2.49.0
