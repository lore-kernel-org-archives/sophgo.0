Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B635219FC
	for <sophgo@lists.linux.dev>; Tue, 10 Jun 2025 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749522618; cv=none; b=quX4FWgyM2jwTYNkbMnovoqjBP6v+7H3Xy3gvRILd/Y2vHzSqt0yPT2eptf1veO+pgLR2mfnYvb5aA7Y/7eO9UqeuFcqxHXkr8zKt/KOR3kCMHqmnC18nRPtKKmYiBYT7C+wTAtoDkEhwFEQDCX58sODW08u4n23IlQn3B10RSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749522618; c=relaxed/simple;
	bh=v3LESvPLiUPkpigP+R05pYukPxN/Hh3UfMtabIzddaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SI7NUfMYqyw81BBtTbTWNnasGw7CJX4JG13054u39mxRKRy89zOqC4TZaA4dCkeE7qttyJktar8LfADTSWEeHHmuV1RRG4sSKpp5i7DXC4+/x4C5Uu2CIxvHTr31SZFQCONW16NmVCjHwD5RYiAT+S8LjPPFti24ol7/QMHpA7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVBZshF1; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVBZshF1"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d20451c016so264611685a.1
        for <sophgo@lists.linux.dev>; Mon, 09 Jun 2025 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749522616; x=1750127416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SgElAs0y1ZJkhsU5o9mYZFAkDt+b5eZOursoEKVdA8M=;
        b=nVBZshF1jqSqK7ImxNePmH6BJm7tnwCRNs7wn3yG0HFmV7ULMhaLtsHNv0a6enElxt
         dts7aO+jT/Z0nkumjhokWo+Lge1HGkuP+Mu/eC+cGOfNEkMtm5+9qVVZwI3SNycndUDm
         tRVvlqpKRH/0FBLr83yrxgOKURbLMUcrtJVTIpo57Do4bN/FsfIX6vmcYYoBz2vFSr4i
         AcTsXCI2K0KObPD/p3f9R7d8C3f1u/GmRiddUPygb71XF+SxL7gcCSy20NL/xxyVyzZ5
         C7kOX4ssKb3yyVdOoSx65WEC1jThT88JodZr5SZMIf0ZDtYzYqy10P2Pd4CrtqXfJMl2
         yg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749522616; x=1750127416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgElAs0y1ZJkhsU5o9mYZFAkDt+b5eZOursoEKVdA8M=;
        b=EdyAuAPpXaipSh9D6TShi0MLsK2XJFcCBK6agVXh0p0hhmqEFYPmlS1PiM//wPAQVc
         3MWNiqC5C8vsRARAKVXmWKx84iriNS3IY57pdgdwHAcc/5ipI5JCUW+xybY1E72SnvsD
         6S5KE+8qSm+P/X45wYm6FBIT7hWAYv82Gz/5sNIE6fhz7HlNdi0BlyKqU9rAaoLLL4AO
         cTi+AX0HSJTHb6nBlOuMm79td7ovUmP8K7oYbGQtJbsHO2iY0xGTLrOVu1rRY4Kv5o65
         qz32ig3BjfhTUsBt79CEWOLDDP15XEBZHjlG/KPFcBhqi1Kie7Tv4FYm1Ubawo2kVZim
         9d0w==
X-Forwarded-Encrypted: i=1; AJvYcCW+pI+koD9Rej53bxywfr+O1xYuJxRfo0dVe6KDJ4IGiY6rOGfpaL3+XsZ3maVwGhZqFRV/R7M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhIjaFrmC4psYn7xu/9t5DeM85ZXJNYQzQmf+ieqMOY0k/7g+0
	BnJHCKIHv3YYp2y83DaO0QMXyhfl+xb3HyFf3MR64a7ccu5oKc7c6Qc3
X-Gm-Gg: ASbGncs2spIbYL7utCUz+3KCEBLXYhyLJQFvTcNwyNMJJ1hmW9Ww/ZwwKQY0Mi7dyHV
	a5/1XovDvQTQjXFAY3plOCiTQ5qjx3cxnzZP/oDxqZQD7228DSupXZVXQUPQbiFXSKI7Ho3VS0s
	DZf8fAstioig8dKmnoGuwwObCoYdMZS5XbtUzm2uwOqMQ2lJ8191RPkuTzG/8K0FIyYzYwamnzR
	ssJfcWPJfg78J3e7nuK0YwqA8mDvgNYADD0KTDspXVv+RuvtdaeKjOQXP4LWmV8gHGPD9StoTcA
	S9Ej0fIc5jvxvkMvFPiyb+gMMiWe1w7Hwjd7cA==
X-Google-Smtp-Source: AGHT+IHGAP6xmALkZKuYBUNxKptzmmUckUcUQvkX0yXZ+9n+f0ZjvsKWM3DmWJRkyqr7YpGIbcY5lw==
X-Received: by 2002:a05:620a:1d06:b0:7d3:99db:c4c with SMTP id af79cd13be357-7d399db0c51mr593864685a.6.1749522615969;
        Mon, 09 Jun 2025 19:30:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d2517fa678sm626750385a.22.2025.06.09.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 19:30:15 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:29:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
Message-ID: <orrz4ibchqfiqbbhyxbvlt4ejtu2roankisfy7gfuza2b4phgl@5mbjjnmcm2si>
References: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
 <174952038849.949885.15347540485983948845.b4-ty@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174952038849.949885.15347540485983948845.b4-ty@gmail.com>

On Tue, Jun 10, 2025 at 09:53:12AM +0800, Inochi Amaoto wrote:
> On Tue, 13 May 2025 22:31:25 +0200, Alexander Sverdlin wrote:
> > Add the RTCSYS MFD node: in Cvitek CV18xx and its successors RTC Subsystem
> > is quite advanced and provides SoC power management functions as well.
> > 
> > The SoC family also contains DW8051 block (Intel 8051 compatible CPU core)
> > and an associated SRAM. The corresponding control registers are mapped into
> > RTCSYS address space as well.
> > 
> > [...]
> 
> Applied to fixes, thanks!
> 
> [1/1] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
>       (no commit info)
> 
> Thanks,
> Inochi
> 

Should be for-next branch, I execute in a wrong branch....
The url should be
https://github.com/sophgo/linux/commit/3a8cef361be50c59013cdb2d804c12476c76e848

Regards,
Inochi
