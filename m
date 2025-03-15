Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B964A06
	for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 00:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741999832; cv=none; b=B78APH/zjLQmogAqQVULnJbrT/q5oWVkiZaBAi9dAoFMaXzh0zgKoz9K7N6w6eAXzrICVSFSqWX8X5GoOYwgWUZ4ENgnphFhZFJpX2VSTLOrxrRLMTwWthYhsED0rxUKJcionhMYh2plc5n0BWcd64Db+bGfn5ANXBgTFmfYzvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741999832; c=relaxed/simple;
	bh=4ZHzDpFNmj0jXgDXu0digMqc5RDfhYEUTy3AxzDTkBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9dJpC+pTA3uho5gP5EKeaLlaDSejy5TOVn/l+TDFSvC0y9nmet/xVeaEBWbbkCGBiivboTuQTeRNBs+e7PEuz5PlNGhtf5NiCti5vAdcUR/Bo4YfhQwE3eXlbTrj1CBBFTUX4nIt9Xhwo/bJqD/FP6SGukHjdwjJG3ccD0o4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hc0d+Hhf; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hc0d+Hhf"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476ae781d21so26769551cf.3
        for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 17:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741999829; x=1742604629; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XL0DMg+SaimZCHhr18HPXkZgkXm2yI2aAJewslZgM2o=;
        b=Hc0d+HhfG0SDisuEN1v4Yg4ZIWo6PWm41T4r2PD8+/MX8U8M+Cn37xZy80L44RL5P/
         iqgsNDjw2jWMImBJL/wNVHBz0FmfcH+PnlHE6tu3b1Z+c6gsMNFR/jheDHnc04oD4c3D
         22peU2xm3cYugqftILisce9q32y3gdgVOyucE1m42YCKGeaMNsXInKSrISthPM6Bsuo4
         EzUi0aMu2AjIbF67I9YsoSwq7IgY4DtvVUl6DmZeIUu8S8gyVVYquZy5/xXclWsvGwgt
         WynuYx0ZywRDdRSgIcWDD6SeSlE8zIliS2q+D/aLqBjZOa/SCYADVPE6+gsrFxUMUwy8
         dDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741999829; x=1742604629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XL0DMg+SaimZCHhr18HPXkZgkXm2yI2aAJewslZgM2o=;
        b=Dx6CDfQjTSB9N/dT7OJP50LmAhwVKl4inQ4vFjC9qZMXdO1i388hfrTk9XW29yqOLY
         wiXHU3sPQETmavh1fpIgko9Xo+vBouHEk0s/uoYOxnfPIRiNUVNp0VWqUIJcmvCLPZ0D
         MNtpLRqdMBu6s+MxUPvcHHulZ64/4muwoxRM9KItqyYTqLKpMD1PE+gYjTF1nNKurqc2
         3qp36+Bno6yJW7K+QszK5Vh33vSMGQNzbl7DZXu44w6vEWuMnzZnNlEf8MRmf00v6jAK
         lAV2eskoaZV0GqSDcgb4cKetorECKlUf+ciY++Ep9Rgb3I35F6INuYWQnm/2NHEMkLmo
         LHWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU146tZieRlwn9h1KtaKFgrhML2kRlok2qDPuQhKwg7Zdn7rZlG9f1mojQttIjbrDNxE5g6gM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzNW88sdxT4Y1p2aQ6AaYe0og3UMmKVepgKrv5BhbNr0hos7wX
	cjEYkI9jP54bi/k8uJT4S+qVZoRbDcks4B6Fnbl1JrrtOonQElhNUi0Zu+rN
X-Gm-Gg: ASbGnctCzk4xcmw5GXvs9HbpooO9D0EZy87LcchTGsa61GO4DBNzFY93q0XExrV0etZ
	ipZXMYsOz09IfkyIORGijNCLPF5s5JgXKLFnLt85EeG/wtGFR/BbYky9OXiQXAdp06tqSPDA17i
	BVcvxQtUO2Vq3F/1fJqX5gADkCtjoPUuTA6UFRV1RuwXISFx8Q2NGBSJBoHVLznxB7voysg5WsL
	6vPN52NsjoOfNsXnttkiMGnglfEwIgF9KgHPtsgsNohS2L50bOWMUHn/dMKA6SCKnZMqORn4xYc
	8fY2qK1epdwobUNIerkV
X-Google-Smtp-Source: AGHT+IFvQ9bf7j0bsVydFqN+0fJ+kH39Oh2c16QC7usKjIe+mizhREpZmPxq1sQHO0ujeh7++0yTiA==
X-Received: by 2002:a05:622a:354:b0:476:9847:7c6e with SMTP id d75a77b69052e-476c814a7aamr67976661cf.19.1741999829372;
        Fri, 14 Mar 2025 17:50:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-476bb60aac8sm29093511cf.15.2025.03.14.17.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 17:50:28 -0700 (PDT)
Date: Sat, 15 Mar 2025 08:50:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, 
	soc@kernel.org, Conor Dooley <conor@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Message-ID: <futjsg55afhxz5whuve4qgnicdupedz4qgqbeox2pp6s5p4tfi@h6ueigflfs4m>
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
 <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
 <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
 <CACRpkdarxLiyfZJisyW3F_ipiOgOP189iqUkeGtuKKttHp8F1w@mail.gmail.com>
 <ilkznijefh5haqed3hpj5mynqiqoqvmzodes6os2cccy3tdxf7@zvv3o7k2eful>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ilkznijefh5haqed3hpj5mynqiqoqvmzodes6os2cccy3tdxf7@zvv3o7k2eful>

On Sat, Mar 15, 2025 at 07:44:37AM +0800, Inochi Amaoto wrote:
> On Sat, Mar 15, 2025 at 12:42:12AM +0100, Linus Walleij wrote:
> > On Sat, Mar 15, 2025 at 12:20 AM Inochi Amaoto <inochiama@gmail.com> wrote:
> > 
> > > I guess this means we should checkout the binding patch in Linus's tree
> > > and merge it without other driver patch? Or just take the binding patch
> > > from the patch serie and let the git ignore the same thing?
> > 
> > Either way works, it will not have the same hash so it will appear twice
> > in the history but it will be textually identical and git will sort it out.
> > 
> 
> Cool, we will have a try, and send a new PR if everything is 
> fine. Thanks.
> 

It looks like there always is a duplicate commit, I think it will be
better to hold this patch and submit it in the next cycle. Anyway,
thanks for your suggestion.

Regards,
Inochi
