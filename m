Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7B213635E
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 02:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768877778; cv=none; b=N1PbnXYSA2RgWdk/CmkHGrOPHuh62YpBPCZEKuxHC0OrSAvAwPlJsckLNBOq8cL/9/1LNodxeRlmCguF+auHHGm/UvxgOYXZtXBQwVAAFB5QSbK2xZ8vTvjQNeBD0rez3neJd68Og6tHWvzGrV49fJsFeBlj9zbDSP4qXF7Mc6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768877778; c=relaxed/simple;
	bh=n5A0OXSyk7lo7f3jHURyz0bX/5X3lYhpTO7Z9MO/Uec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e2bljYG2Fmts4wfFZw9INcy1mSctqeqfqHltgwBs/lxIPjUVLassIpnBHmRDwepDMX9in38ke4qckbQrjCG4Oj9NGxzzNDR4GLIOtZWWBftkYvUnWbdL58knf9PXD0xJ8oipOM4TFs5OZjIdyK81DvxJaq1C/0br5ueB6JzAdZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvmFikoP; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvmFikoP"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c52f15c5b3so570365385a.3
        for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 18:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768877776; x=1769482576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=OvmFikoPBUHSRdk6/Kr/lDcXUeCJthjarBZKnx5sieRyhxZ8f9f6YJKqbNRBpvOZco
         TSPbsJWfdLFaWAjTfnH23VZM+yseGdwDCZPXWk1bEPWAnDgIzkoRtdFCjHTNMh/nu5vw
         M25r/roppL6INEtd6ucmkGusbdsDlUfik8Nx1vku6LgHe56/5WWccwGvKVeMZ10Inn8R
         Uto77XorrMhdUxkbph50LGr591v991JPZE5iZlE2hSH3pl0Z0J0bDjM/jae/nPHmjXCC
         aC9GkCC3Cr65auNhgSLwkDUmH3FrYxTWMHgc4UuB090PUP4Ms6u/YNsgYReV6iAa8Mzg
         TrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768877776; x=1769482576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=D+NcmrJmu/DfdMm15viOSbRt0S5FKjAufnBUhKBdWVTRc6DhcWf3B+jVE9x51hC3kd
         UGS5oF/n4QjZYiWvQc51ehktB706JowI+7gsoc5iV1MQa5mBYH5wVwKmjVitJlN/4Lu6
         P/GJ0IWRRkywXVMYpNRDOm0bVtab0uiNK7WoaSJN5AjPM9qYjdobEhumzPj/eiocWkx5
         UufYtmU6EQSW3Wp3q7WYiMMEJpNvM/55dPVMUWiQc0NKHRPG9yxVvnvsCDDQCQMoTlsg
         nv+4T8R2BzuOD0nfn4JTc5Ire6mGH+JBNyCGou6NcQCuV+I0MqIpcHqLAn9Nhqh/12Gb
         6rkA==
X-Forwarded-Encrypted: i=1; AJvYcCUHLm6hhxZZeqSVJXLfuiFbRRcYceKF7nJaPDCedmFMNbheJAkw4DCirfKkXMbr9hLXbh5IjUQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZl34ymXpiziTkUQr5QbQiitCWTfElWa4PEAfMzDlS4mlE/66X
	gWYcQGUEVLQQxVnehWJ9J75upUZFb/idoqFFMmd+vTqmm1jDPXqnHtGh8HVFVGyQ
X-Gm-Gg: AY/fxX5GsoHt927/Cw4agEe4lTZeOPAIC/Xd6KMhT/kecscdRwLJuh9LMZ3DBqLrvkS
	n8O+yG6OhLnKIRYj10Yv3/ferERlodcweuedKA3l4no79pzrQ3gVxF5IWMCCWdCGVUEHcnoGhry
	0nftYM5tZqL3mWXRIlm08FMfvMpBSWOSeR7gjdIw2F47Tvv+AK7N+1o/O+kE8fryxQj+jZ/ZiNZ
	xlNTFS5rf0ieSU5FVS82wR+B57CRJpy8aKRiWy2NgvKys7Q+Sq10+x+76COGePiK6SvxpH8daym
	bz6aQVQCiJbdP3i3yYWvg74k4l1VCGDMSmdD1vnYMiEmkpZU/1gRsx/d4XTK4Kn+DDdxhJIIRpZ
	Q/asrfDIXyRsCY2VaMIuyQiXrrKsthufTbh3ePbImWS8MIGapv3Z1c5btS51c/zodwBAktr9lpt
	XLyPXI/R76lQ==
X-Received: by 2002:a05:7022:6288:b0:11b:7824:5c97 with SMTP id a92af1059eb24-1244a769feemr12788374c88.40.1768871785704;
        Mon, 19 Jan 2026 17:16:25 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6fba43c3dsm747540eec.0.2026.01.19.17.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:16:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
Date: Tue, 20 Jan 2026 09:16:14 +0800
Message-ID: <176887176536.427065.4468747981087466363.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 15 Jan 2026 07:18:56 +0800, Guodong Xu wrote:
> The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
> much later than its component extensions zba/zbb/zbs (June 2021). Recent
> updates to the device tree bindings [2] enforce that when all three
> component extensions are present, "b" must also be specified. Related
> discussion can also be found in [1].
> 
> Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
> It is a trivial update, but can help readers reference the correct
> document version. Acked-by Paul Walmsley in v1.
> 
> [...]

Applied to dt/riscv, thanks!

[3/4] riscv: dts: sophgo: sg2044: Add "b" ISA extension
      https://github.com/sophgo/linux/commit/f16ae81b80ca4e721f4c4ed1f28390115f7721eb

Thanks,
Inochi

