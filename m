Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5C923EA96
	for <sophgo@lists.linux.dev>; Sat,  1 Nov 2025 23:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762040669; cv=none; b=MBSZ0N6R+8qI5dts9zQQ4j480VYPG3x7aeKMn15uHt/si3U/y45gKMRuWJBYmy+lA41SwncM9XGKzJTXyy5MubkhqBdjN0vqVh/XVcNQ5y8jS3ExizXRjDMYU6vLS/DNFuriM8DYJYBlYgK8ni0LTsrlhCnAUHx1AeSsIjlRUy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762040669; c=relaxed/simple;
	bh=jh7KR1Uq6F54HgOUIevcql72dp2/doXnUhOqdIkZoG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iQN7Z+jPHrYs3b6YATdf6D4kZLcpfmxqotp5X9JuQaMngb9voI6RAp913eUUPsyZtHfB8i9qqmWH1BGbO1+izvcp8Jqm5R2U0sXr3/x1Eb7kP9Oqw1dLdG25ZNVkwo7qGzn0KKoesGK3w0mwGVrEnmGTkdDY09t/IMHnnSSdKC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSM536JF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSM536JF"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2698384978dso27943765ad.0
        for <sophgo@lists.linux.dev>; Sat, 01 Nov 2025 16:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762040667; x=1762645467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5xrL6w1s6Y/SwQgHOGtWpqSk58YCr4boule2VrLo7o=;
        b=VSM536JFbSVXdQxdG5qbjjdVImz/uT6Gi3iRrVmHortD6cvANrW73W0AAyW6tlp82G
         R2H/H+fXzBmYnRJOMmLoTgfXqEpX99cTUcbXndr8CgMmGC1ZOdS0zx3R/DTpGQmS/AlS
         uYaXdVQSK/LQS7jYmGh3sNtZNB1N37CC7rwdWHDsX+D6R1keDdwlVlLepetrZt0v+kCd
         CKNDZpTJEi7IEVITUIX2W3jMdIejTh+oQJsYy0yLWab4I4aGAoFR1FiBC9N7x+gBBc9T
         30jqSjEI4YCg2o43sltKGsadswNze4t+i5MZOs8gAkUHJepN29sevjyONSjkMQ7bX6Lx
         tuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762040667; x=1762645467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5xrL6w1s6Y/SwQgHOGtWpqSk58YCr4boule2VrLo7o=;
        b=XAMH1q4uJbiv/kiMaGszLDon64N/Yk+7dOwVucWJa29RnRfY5oyburlIk9In+4iJ9t
         DZleboDOxP3U6BWMU2auCGBvv8PlUpr37OpcdjAbyUlr5cvLDLR1VSXxDJmivKf184YY
         KpSUuJMg5fAXm5xkwFQjKNKLcRJ1hMwCyj1b6OatdmzL55WUsIsPvMAVn7F4rlRFRPUJ
         Iwp9OuUcC1f4BPvuSme+jyVWWUHeHI39agUdzA7PrBxnoz49Atkn1u+zNP1gR15+clHg
         fMJd8KQkebxis0Gd6ebqZYPm0QSy5DkkmM9NsgpUb07fm1fu6/QnINrMoP28LGE09X9f
         jPwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCIxmw0GQrKQcZt8IXdIJDpmJYZjkCKqLCjDm6whOS+Bd1jm5K5dpZr6+/sM6F8EKINbttT5w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8vboV2FLoJ5GKT91c8V1LD95+n4TdBRDDnY0bMRwEdAknSXCW
	ohpla0CEkh3erC6Of2kSutw+CBlbP5DbX9m3RdaydGrUyWwnt2vW6ZVC
X-Gm-Gg: ASbGnctB3mXv8zUk2C+8ySkckQ8UNG1S/sj+xGCjZISTh3+pWaj7sK6ggUQ4f9J9ck3
	a3X63+h9s+RmsJ3dC4yAOjtXzasF6W9ZrOU8Kab4gnUBYrh8eAdv834+slZBkPHjMhF5pfXmW8H
	lAZ/kH/81Vra24Ly/yzHCjI7Ij0wbwrlKtKfBYHxW1PfrABk5uh5cs0/5tNf8ljpa2rLSeqQ6vZ
	ItveABDAWlfbmFZ/dLFykFoR/XoagL7mL3bxeyCQpXk1fepTdVQPO8a2mrm/BOxS97xo0FrbBTC
	oFQt3ackQgArFFPxyaurKoJHMIaWBtmxT1UqVCkwrZr/LLSt3BxN76xnIJ8kixDSyTJCfGnFJat
	ZcM2NLfZQ/lCpIPPsMZ2RMdaxNN2SiVgpj4ov7xFhJziFTanWthG8U6jknavjbh0n2k5nRSxZ6E
	XewlllG4IHDg==
X-Google-Smtp-Source: AGHT+IHes7gAPMGnU9C8dtef1adr+TMQgs0cEQ/JgUMpaIjuvVBJgyDHwEuzKah+vpeRkyOHYuQGpw==
X-Received: by 2002:a17:902:c942:b0:295:7f1f:a80a with SMTP id d9443c01a7336-2957f1fb69dmr17823945ad.27.1762040666931;
        Sat, 01 Nov 2025 16:44:26 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340b070ec06sm4370384a91.3.2025.11.01.16.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 16:44:26 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	rabenda.cn@gmail.com,
	krzk+dt@kernel.org,
	mani@kernel.org,
	liujingqi@lanxincomputing.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	Chen Wang <unicornxw@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 0/4] Add PCIe support in DTS for Sophgo SG2042 SoC
Date: Sun,  2 Nov 2025 07:44:12 +0800
Message-ID: <176204064246.157916.1254578946904175496.b4-ty@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1760929111.git.unicorn_wang@outlook.com>
References: <cover.1760929111.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 20 Oct 2025 11:32:55 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> This new patch set is a continuation of the previous patchset
> "[PATCH v3 0/7] Add PCIe support to Sophgo SG2042 SoC" [1].
> 
> The drivers and bindings have already been merged into the kernel
> mainline, and this patchset will focus on submitting the remaining
> DTS changes into the mainline.
> 
> [...]

Applied to dt/riscv, thanks!

[1/4] riscv: sophgo: dts: add PCIe controllers for SG2042
      https://github.com/sophgo/linux/commit/4e27aca4881ace1e9a812fc2c88b33dd84e29993
[2/4] riscv: sophgo: dts: enable PCIe for PioneerBox
      https://github.com/sophgo/linux/commit/b85ad0d06a19de95d41f91162389a1bbb461a405
[3/4] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
      https://github.com/sophgo/linux/commit/c6c215099e89b1eb71ed6592163ae5b530f4538e
[4/4] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0
      https://github.com/sophgo/linux/commit/579d6526aa43a155c8685a88ef8350a8c29afa47

Thanks,
Inochi

